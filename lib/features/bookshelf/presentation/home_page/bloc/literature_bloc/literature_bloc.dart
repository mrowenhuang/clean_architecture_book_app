import 'dart:async';

import 'package:book_app/features/bookshelf/domain/entities/feature_book_entities.dart';
import 'package:book_app/features/bookshelf/domain/usecases/literature_book_get.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'literature_event.dart';
part 'literature_state.dart';

class LiteratureBloc extends Bloc<LiteratureEvent, LiteratureState> {
  final LiteratureBookGet _literatureBookGet;

  LiteratureBloc(this._literatureBookGet) : super(LiteratureInitial()) {
    on<GetLiteratureBookEvent>(getLiteratureBookEvent);
  }

  FutureOr<void> getLiteratureBookEvent(
    GetLiteratureBookEvent event,
    Emitter<LiteratureState> emit,
  ) async {
    emit(LoadingGetLiteratureBookState());
    final response = await _literatureBookGet.call();

    response.fold(
      (failure) {
        emit(ErrorGetLiteratureBookState(failure: failure.message));
      },
      (response) {
        emit(SuccessGetLiteratureBookState(books: response));
      },
    );
  }
}
