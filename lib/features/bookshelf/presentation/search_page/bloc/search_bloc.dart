import 'dart:async';

import 'package:book_app/features/bookshelf/domain/entities/search_book_entities.dart';
import 'package:book_app/features/bookshelf/domain/usecases/search_book_get.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchBookGet _searchBookGet;

  SearchBloc(this._searchBookGet) : super(SearchInitial()) {
    on<GetSearchEvent>(getSearchEvent);
  }

  FutureOr<void> getSearchEvent(
    GetSearchEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(LoadingGetSearchBookState());
    final response = await _searchBookGet.call(event.value);

    response.fold(
      (failure) {
        emit(ErrorGetSearchBookState(failure: failure.message));
      },
      (response) {
        emit(SuccessGetSearchBookState(books: response));
      },
    );
  }
}
