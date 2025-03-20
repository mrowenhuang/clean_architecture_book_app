part of 'bookshelf_bloc.dart';

abstract class BookshelfState extends Equatable {
  const BookshelfState();  

  @override
  List<Object> get props => [];
}
class BookshelfInitial extends BookshelfState {}
