import 'dart:async';

import 'package:book_app/features/bookshelf/domain/entities/feature_book_entities.dart';
import 'package:book_app/features/bookshelf/domain/usecases/thrillers_book_get.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'thrillers_event.dart';
part 'thrillers_state.dart';

class ThrillersBloc extends Bloc<ThrillersEvent, ThrillersState> {
  final ThrillersBookGet _thrillersBookGet;

  ThrillersBloc(this._thrillersBookGet) : super(ThrillersInitial()) {
    on<GetThrillersBookEvent>(getThrillersBookEvent);
  }

  FutureOr<void> getThrillersBookEvent(
    GetThrillersBookEvent event,
    Emitter<ThrillersState> emit,
  ) async {
    emit(LoadingGetThrillersBookState());
    final response = await _thrillersBookGet.call();

    response.fold(
      (failure) {
        emit(ErrorGetThrillersBookState(failure: failure.message));
      },
      (response) {
        emit(SuccessGetThrillersBookState(books: response));
      },
    );
  }
}
