import 'dart:async';

import 'package:book_app/features/bookshelf/domain/entities/bookmark_entities.dart';
import 'package:book_app/features/bookshelf/domain/usecases/bookmark_get.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  final BookmarkGet _bookmarkGet;

  BookmarkBloc(this._bookmarkGet) : super(BookmarkInitial()) {
    on<GetBookmarkEvent>(getBookmarkEvent);
  }

  FutureOr<void> getBookmarkEvent(
    GetBookmarkEvent event,
    Emitter<BookmarkState> emit,
  ) async {
    emit(LoadingGetBookmarkState());
    final response = await _bookmarkGet.call();

    response.fold(
      (failure) {
        emit(ErrorGetBookmarkState(message: failure.message));
      },
      (response) {
        emit(SuccessGetBookmarkState(response));
      },
    );
  }
}
