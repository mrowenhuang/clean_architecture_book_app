import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bookshelf_event.dart';
part 'bookshelf_state.dart';

class BookshelfBloc extends Bloc<BookshelfEvent, BookshelfState> {
  BookshelfBloc() : super(BookshelfInitial()) {
    on<BookshelfEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
