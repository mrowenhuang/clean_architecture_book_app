import 'dart:async';

import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/bookshelf/domain/entities/quotes_entities.dart';
import 'package:book_app/features/bookshelf/domain/usecases/quotes_get.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quotes_event.dart';
part 'quotes_state.dart';

class QuotesBloc extends Bloc<QuotesEvent, QuotesState> {
  final QuotesGet _quotesGet;

  QuotesBloc(this._quotesGet) : super(QuotesInitial()) {
    on<GetQuotesEvent>(getQuotesEvent);
  }
  FutureOr<void> getQuotesEvent(
    GetQuotesEvent event,
    Emitter<QuotesState> emit,
  ) async {
    emit(LoadingGetQuotesState());

    final response = await _quotesGet.call();

    response.fold(
      (failure) {
        emit(ErrorGetQuotesState(failure));
      },
      (response) {
        emit(SuccessGetQuotesState(response));
      },
    );
  }
}
