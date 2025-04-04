part of 'programming_bloc.dart';

sealed class ProgrammingState extends Equatable {
  const ProgrammingState();

  @override
  List<Object> get props => [];
}

final class ProgrammingInitial extends ProgrammingState {}

final class LoadingGetProgrammingBookState extends ProgrammingState {}

final class SuccessGetProgrammingBookState extends ProgrammingState {
  final List<FeatureBookEntities> books;

  const SuccessGetProgrammingBookState({required this.books});
}

final class ErrorGetProgrammingBookState extends ProgrammingState {
  final String failure;

  const ErrorGetProgrammingBookState({required this.failure});
}
