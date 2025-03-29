part of 'quotes_bloc.dart';

sealed class QuotesState extends Equatable {
  const QuotesState();
  
  @override
  List<Object> get props => [];
}

final class QuotesInitial extends QuotesState {}

final class SuccessGetQuotesState extends QuotesState {
  final QuotesEntities quotes;

  const SuccessGetQuotesState(this.quotes);
}

final class ErrorGetQuotesState extends QuotesState {
  final ServerFailure failure;

  const ErrorGetQuotesState(this.failure);
}

final class LoadingGetQuotesState extends QuotesState {}
