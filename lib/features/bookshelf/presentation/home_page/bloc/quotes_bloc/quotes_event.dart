part of 'quotes_bloc.dart';

sealed class QuotesEvent extends Equatable {
  const QuotesEvent();

  @override
  List<Object> get props => [];
}

final class GetQuotesEvent extends QuotesEvent {}
