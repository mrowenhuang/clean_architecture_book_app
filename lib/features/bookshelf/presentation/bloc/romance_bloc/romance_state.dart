part of 'romance_bloc.dart';

sealed class RomanceState extends Equatable {
  const RomanceState();

  @override
  List<Object> get props => [];
}

final class RomanceInitial extends RomanceState {}

final class SuccessGetRomanceBookState extends RomanceState {
  final List<FeatureBookEntities> books;

  const SuccessGetRomanceBookState(this.books);
}

final class ErrorGetRomanceBookState extends RomanceState {
  final ServerFailure failure;

  const ErrorGetRomanceBookState(this.failure);
}

final class LoadingGetRomanceBookState extends RomanceState {}
