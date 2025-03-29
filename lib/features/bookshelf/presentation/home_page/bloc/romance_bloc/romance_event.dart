part of 'romance_bloc.dart';

sealed class RomanceEvent extends Equatable {
  const RomanceEvent();

  @override
  List<Object> get props => [];
}

final class GetRomanceBookEvent extends RomanceEvent {}