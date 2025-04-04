import 'dart:async';

import 'package:book_app/features/bookshelf/domain/entities/feature_book_entities.dart';
import 'package:book_app/features/bookshelf/domain/usecases/programming_book_get.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'programming_event.dart';
part 'programming_state.dart';

class ProgrammingBloc extends Bloc<ProgrammingEvent, ProgrammingState> {
  final ProgrammingBookGet _programmingBookGet;

  ProgrammingBloc(this._programmingBookGet) : super(ProgrammingInitial()) {
    on<GetProgrammingBookEvent>(getProgrammingBookEvent);
  }

  FutureOr<void> getProgrammingBookEvent(
    GetProgrammingBookEvent event,
    Emitter<ProgrammingState> emit,
  ) async {
    emit(LoadingGetProgrammingBookState());
    final response = await _programmingBookGet.call();

    response.fold(
      (failure) {
        emit(ErrorGetProgrammingBookState(failure: failure.message));
      },
      (response) {
        emit(SuccessGetProgrammingBookState(books: response));
      },
    );
  }
}
