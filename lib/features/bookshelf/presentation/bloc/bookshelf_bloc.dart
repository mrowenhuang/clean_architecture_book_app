import 'dart:async';

import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/bookshelf/domain/entities/quotes_entities.dart';
import 'package:book_app/features/bookshelf/domain/usecases/quotes_get.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bookshelf_event.dart';
part 'bookshelf_state.dart';

class BookshelfBloc extends Bloc<BookshelfEvent, BookshelfState> {
  final QuotesGet _quotesGet;

  BookshelfBloc(this._quotesGet) : super(BookshelfInitial()) {
    on<GetQuotesEvent>(getQuotesEvent);
  }

  FutureOr<void> getQuotesEvent(
    GetQuotesEvent event,
    Emitter<BookshelfState> emit,
  ) async {
    emit(LoadingGetQuotes());

    final response = await _quotesGet.call();

    response.fold(
      (failure) {
        emit(ErrorGetQuotes(failure));
      },
      (response) {
        emit(SuccessGetQuotes(response));
      },
    );
  }
}
