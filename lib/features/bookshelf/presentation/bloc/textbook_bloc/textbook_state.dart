part of 'textbook_bloc.dart';

sealed class TextbookState extends Equatable {
  const TextbookState();

  @override
  List<Object> get props => [];
}

final class TextbookInitial extends TextbookState {}

final class SuccessGetTextbookState extends TextbookState {
  final List<FeatureBookEntities> books;

  const SuccessGetTextbookState(this.books);
}

final class ErrorGetTextbookState extends TextbookState {
  final ServerFailure failure;

  const ErrorGetTextbookState(this.failure);
}

final class LoadingGetTextbookState extends TextbookState {}
