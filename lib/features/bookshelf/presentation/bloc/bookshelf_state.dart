part of 'bookshelf_bloc.dart';

abstract class BookshelfState extends Equatable {
  const BookshelfState();

  @override
  List<Object> get props => [];
}

class BookshelfInitial extends BookshelfState {}

final class SuccessGetQuotes extends BookshelfState {
  final QuotesEntities quotes;

  const SuccessGetQuotes(this.quotes);
}

final class ErrorGetQuotes extends BookshelfState {
  final ServerFailure failure;

  const ErrorGetQuotes(this.failure);
}

final class LoadingGetQuotes extends BookshelfState {}
