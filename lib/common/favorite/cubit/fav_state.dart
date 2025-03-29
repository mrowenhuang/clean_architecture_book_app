part of 'fav_cubit.dart';

sealed class FavState extends Equatable {
  const FavState();

  @override
  List<Object> get props => [];
}

final class FavInitial extends FavState {}

final class SuccessAddFavState extends FavState {
  final String message;

  const SuccessAddFavState({required this.message});
}

final class LoadingAddFavState extends FavState {}

final class ErrorAddFavState extends FavState {
  final String failure;

  const ErrorAddFavState({required this.failure});
}
