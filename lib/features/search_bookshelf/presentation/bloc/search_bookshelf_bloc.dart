import 'dart:async';

import 'package:book_app/features/search_bookshelf/domain/entities/search_book_entities.dart';
import 'package:book_app/features/search_bookshelf/domain/usecases/search_book_get.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_bookshelf_event.dart';
part 'search_bookshelf_state.dart';

class SearchBookshelfBloc
    extends Bloc<SearchBookshelfEvent, SearchBookshelfState> {
  final SearchBookGet _searchBookGet;

  SearchBookshelfBloc(this._searchBookGet) : super(SearchBookshelfInitial()) {
    on<GetSearchBookshelfEvent>(getSearchBookshelfEvent);
  }

  FutureOr<void> getSearchBookshelfEvent(
    GetSearchBookshelfEvent event,
    Emitter<SearchBookshelfState> emit,
  ) async {
    emit(LoadingGetSearchBookshelfState());
    final response = await _searchBookGet.call(event.value);

    response.fold((failure) {
      emit(ErrorGetSearchBookshelfState(failure: failure.message));
    }, (response) {
      emit(SuccessGetSearchBookshelfState(books: response));
    },);

  }
}
