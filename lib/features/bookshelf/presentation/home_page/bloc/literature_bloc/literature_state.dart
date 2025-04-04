part of 'literature_bloc.dart';

sealed class LiteratureState extends Equatable {
  const LiteratureState();

  @override
  List<Object> get props => [];
}

final class LiteratureInitial extends LiteratureState {}

final class LoadingGetLiteratureBookState extends LiteratureState {}

final class SuccessGetLiteratureBookState extends LiteratureState {
  final List<FeatureBookEntities> books;

  const SuccessGetLiteratureBookState({required this.books});
}

final class ErrorGetLiteratureBookState extends LiteratureState {
  final String failure;

  const ErrorGetLiteratureBookState({required this.failure});
}
