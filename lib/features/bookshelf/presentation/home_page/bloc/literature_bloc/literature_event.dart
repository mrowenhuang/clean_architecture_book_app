part of 'literature_bloc.dart';

sealed class LiteratureEvent extends Equatable {
  const LiteratureEvent();

  @override
  List<Object> get props => [];
}

final class GetLiteratureBookEvent extends LiteratureEvent{}

