import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/bookshelf/domain/entities/book_entities.dart';
import 'package:dartz/dartz.dart';

abstract class BookRepository {
  Future<Either<ServerFailure, List<BookEntities>>> getTrendingBook();
}
