import 'dart:async';

import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/bookshelf/domain/entities/feature_book_entities.dart';
import 'package:book_app/features/bookshelf/domain/usecases/trending_book_get.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final TrendingBookGet _trendingBookGet;

  TrendingBloc(this._trendingBookGet) : super(TrendingInitial()) {
    on<GetTrendingBookEvent>(getTrendingBookEvent);
  }
  FutureOr<void> getTrendingBookEvent(
    GetTrendingBookEvent event,
    Emitter<TrendingState> emit,
  ) async {
    emit(LoadingGetTrendingBookState());

    final response = await _trendingBookGet.call();

    response.fold(
      (failure) {
        emit(ErrorGetTrendingBookState(failure));
      },
      (response) {
        emit(SuccessGetTrendingBookState(response));
      },
    );
  }
}
