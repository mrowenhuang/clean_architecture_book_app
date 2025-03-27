part of 'search_bookshelf_bloc.dart';

abstract class SearchBookshelfEvent extends Equatable {
  const SearchBookshelfEvent();

  @override
  List<Object> get props => [];
}


final class GetSearchBookshelfEvent extends SearchBookshelfEvent {
  final String value;

  const GetSearchBookshelfEvent({required this.value});
}