import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_bookshelf_event.dart';
part 'search_bookshelf_state.dart';

class SearchBookshelfBloc extends Bloc<SearchBookshelfEvent, SearchBookshelfState> {
  SearchBookshelfBloc() : super(SearchBookshelfInitial()) {
    on<SearchBookshelfEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
