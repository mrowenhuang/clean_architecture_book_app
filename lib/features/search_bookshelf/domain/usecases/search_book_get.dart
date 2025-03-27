import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/search_bookshelf/domain/entities/search_book_entities.dart';
import 'package:book_app/features/search_bookshelf/domain/repositories/search_book_repository.dart';
import 'package:dartz/dartz.dart';

class SearchBookGet {
  final SearchBookRepository _searchBookRepository;

  SearchBookGet(this._searchBookRepository);

  Future<Either<ServerFailure, List<SearchBookEntities>>> call(
    String value,
  ) async {
    return await _searchBookRepository.getSearchBook(value);
  }
}
