import 'dart:async';

import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/bookshelf/domain/entities/feature_book_entities.dart';
import 'package:book_app/features/bookshelf/domain/usecases/text_book_get.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'textbook_event.dart';
part 'textbook_state.dart';

class TextbookBloc extends Bloc<TextbookEvent, TextbookState> {
  final TextBookGet _textBookGet;

  TextbookBloc(this._textBookGet) : super(TextbookInitial()) {
    on<GetTextbookEvent>(getTextbookEvent);
  }

  FutureOr<void> getTextbookEvent(
    GetTextbookEvent event,
    Emitter<TextbookState> emit,
  ) async {
    emit(LoadingGetTextbookState());
    final response = await _textBookGet.call();

    response.fold(
      (failure) {
        emit(ErrorGetTextbookState(failure));
      },
      (response) {
        emit(SuccessGetTextbookState(response));
      },
    );
  }
}
