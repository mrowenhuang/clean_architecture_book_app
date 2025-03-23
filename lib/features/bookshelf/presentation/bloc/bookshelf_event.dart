part of 'bookshelf_bloc.dart';

abstract class BookshelfEvent extends Equatable {
  const BookshelfEvent();

  @override
  List<Object> get props => [];
}


final class GetQuotesEvent extends BookshelfEvent {}

final class GetTrendingBookEvent extends BookshelfEvent {}
