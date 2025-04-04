part of 'programming_bloc.dart';

sealed class ProgrammingEvent extends Equatable {
  const ProgrammingEvent();

  @override
  List<Object> get props => [];
}

final class GetProgrammingBookEvent extends ProgrammingEvent {}
