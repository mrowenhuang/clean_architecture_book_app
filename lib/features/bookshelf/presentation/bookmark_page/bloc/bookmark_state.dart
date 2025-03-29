part of 'bookmark_bloc.dart';

sealed class BookmarkState extends Equatable {
  const BookmarkState();

  @override
  List<Object> get props => [];
}

final class BookmarkInitial extends BookmarkState {}

final class SuccessGetBookmarkState extends BookmarkState {
  final List<BookmarkEntities> books;

  const SuccessGetBookmarkState(this.books);


}

final class LoadingGetBookmarkState extends BookmarkState {}

final class ErrorGetBookmarkState extends BookmarkState {
  final String message;

  const ErrorGetBookmarkState({required this.message});
}
