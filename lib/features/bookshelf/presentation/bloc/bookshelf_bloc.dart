import 'dart:async';

import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/bookshelf/domain/entities/feature_book_entities.dart';
import 'package:book_app/features/bookshelf/domain/entities/quotes_entities.dart';
import 'package:book_app/features/bookshelf/domain/usecases/quotes_get.dart';
import 'package:book_app/features/bookshelf/domain/usecases/trending_book_get.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bookshelf_event.dart';
part 'bookshelf_state.dart';

class BookshelfBloc extends Bloc<BookshelfEvent, BookshelfState> {
  final QuotesGet _quotesGet;
  final TrendingBookGet _trendingBookGet;

  BookshelfBloc(this._quotesGet, this._trendingBookGet)
    : super(BookshelfInitial()) {
    on<GetQuotesEvent>(getQuotesEvent);
    on<GetTrendingBookEvent>(getTrendingBookEvent);
  }

  FutureOr<void> getQuotesEvent(
    GetQuotesEvent event,
    Emitter<BookshelfState> emit,
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

  FutureOr<void> getTrendingBookEvent(
    GetTrendingBookEvent event,
    Emitter<BookshelfState> emit,
  ) async {
    emit(LoadingGetTrendingBookState());

    final response = await _trendingBookGet.call();

    response.fold(
      (failure) {
        emit(ErrorGetTrendingBookState(failure));
      },
      (response) {
        emit(SuccessGetTrendingBook(response));
      },
    );
  }
}
