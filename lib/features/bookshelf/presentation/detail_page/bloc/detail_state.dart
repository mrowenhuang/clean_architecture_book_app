part of 'detail_bloc.dart';

sealed class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

final class DetailInitial extends DetailState {}

final class LoadingGetDetailBookState extends DetailState {}

final class SuccessGetDetailBookState extends DetailState {
  final String desc;

  const SuccessGetDetailBookState({required this.desc});
}

final class ErrorGetDetailBookState extends DetailState {
  final String failure;

  const ErrorGetDetailBookState({required this.failure});
}
