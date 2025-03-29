part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();
  
  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}


class LoadingGetSearchBookState extends SearchState {}
class SuccessGetSearchBookState extends SearchState {
  final List<SearchBookEntities> books;

  const SuccessGetSearchBookState({required this.books});

}
class ErrorGetSearchBookState extends SearchState {
  final String failure;

  const ErrorGetSearchBookState({required this.failure});

}