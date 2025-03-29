import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/bookshelf/domain/entities/search_book_entities.dart';
import 'package:book_app/features/bookshelf/domain/repositories/book_repository.dart';
import 'package:dartz/dartz.dart';

class SearchBookGet {
  final BookRepository _bookRepository;

  SearchBookGet(this._bookRepository);

  Future<Either<ServerFailure, List<SearchBookEntities>>> call(
    String value,
  ) async {
    return await _bookRepository.getSearchBook(value);
  }
}
