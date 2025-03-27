part of 'search_bookshelf_bloc.dart';

abstract class SearchBookshelfState extends Equatable {
  const SearchBookshelfState();  

  @override
  List<Object> get props => [];
}
class SearchBookshelfInitial extends SearchBookshelfState {}

class LoadingGetSearchBookshelfState extends SearchBookshelfState {}
class SuccessGetSearchBookshelfState extends SearchBookshelfState {
  final List<SearchBookEntities> books;

  const SuccessGetSearchBookshelfState({required this.books});

}
class ErrorGetSearchBookshelfState extends SearchBookshelfState {
  final String failure;

  const ErrorGetSearchBookshelfState({required this.failure});

}

