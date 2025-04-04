part of 'thrillers_bloc.dart';

sealed class ThrillersEvent extends Equatable {
  const ThrillersEvent();

  @override
  List<Object> get props => [];
}


final class GetThrillersBookEvent extends ThrillersEvent {}
