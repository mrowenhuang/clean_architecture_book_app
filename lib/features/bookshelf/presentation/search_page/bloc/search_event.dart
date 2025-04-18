part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}


final class GetSearchEvent extends SearchEvent {
  final String value;

  const GetSearchEvent({required this.value});
}