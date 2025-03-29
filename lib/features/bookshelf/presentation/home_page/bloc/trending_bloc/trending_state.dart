part of 'trending_bloc.dart';

sealed class TrendingState extends Equatable {
  const TrendingState();

  @override
  List<Object> get props => [];
}

final class TrendingInitial extends TrendingState {}

final class SuccessGetTrendingBookState extends TrendingState {
  final List<FeatureBookEntities> books;

  const SuccessGetTrendingBookState(this.books);
}

final class ErrorGetTrendingBookState extends TrendingState {
  final ServerFailure failure;

  const ErrorGetTrendingBookState(this.failure);
}

final class LoadingGetTrendingBookState extends TrendingState {}
