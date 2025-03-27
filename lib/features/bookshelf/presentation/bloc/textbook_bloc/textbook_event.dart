part of 'textbook_bloc.dart';

sealed class TextbookEvent extends Equatable {
  const TextbookEvent();

  @override
  List<Object> get props => [];
}

final class GetTextbookEvent extends TextbookEvent {}