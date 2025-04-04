part of 'thrillers_bloc.dart';

sealed class ThrillersState extends Equatable {
  const ThrillersState();

  @override
  List<Object> get props => [];
}

final class ThrillersInitial extends ThrillersState {}

final class LoadingGetThrillersBookState extends ThrillersState {}

final class SuccessGetThrillersBookState extends ThrillersState {
  final List<FeatureBookEntities> books;

  const SuccessGetThrillersBookState({required this.books});
}

final class ErrorGetThrillersBookState extends ThrillersState {
  final String failure;

  const ErrorGetThrillersBookState({required this.failure});
}
