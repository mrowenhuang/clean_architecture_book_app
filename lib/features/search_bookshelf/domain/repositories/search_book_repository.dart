import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/search_bookshelf/domain/entities/search_book_entities.dart';
import 'package:dartz/dartz.dart';

abstract class SearchBookRepository {
  Future<Either<ServerFailure,List<SearchBookEntities>>> getSearchBook(String value);
}