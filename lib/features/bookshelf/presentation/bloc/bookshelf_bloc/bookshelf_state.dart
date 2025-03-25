part of 'bookshelf_bloc.dart';

abstract class BookshelfState extends Equatable {
  const BookshelfState();

  @override
  List<Object> get props => [];
}

class BookshelfInitial extends BookshelfState {}



final class SuccessGetTrendingBook extends BookshelfState {
  final List<FeatureBookEntities> books;

  const SuccessGetTrendingBook(this.books);
}



final class ErrorGetTrendingBookState extends BookshelfState {
  final ServerFailure failure;

  const ErrorGetTrendingBookState(this.failure);
}


final class LoadingGetTrendingBookState extends BookshelfState {}
