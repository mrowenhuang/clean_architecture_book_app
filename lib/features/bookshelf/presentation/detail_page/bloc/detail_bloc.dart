import 'dart:async';

import 'package:book_app/features/bookshelf/domain/usecases/detail_book_get.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final DetailBookGet _detailBookGet;

  DetailBloc(this._detailBookGet) : super(DetailInitial()) {
    on<GetDetailEvent>(getDetailEvent);
  }

  FutureOr<void> getDetailEvent(
    GetDetailEvent event,
    Emitter<DetailState> emit,
  ) async {
    emit(LoadingGetDetailBookState());
    final response = await _detailBookGet.call(event.value);
    response.fold(
      (failure) {
        emit(ErrorGetDetailBookState(failure: failure.message));
      },
      (response) {
        emit(SuccessGetDetailBookState(desc: response));
      },
    );
  }
}
