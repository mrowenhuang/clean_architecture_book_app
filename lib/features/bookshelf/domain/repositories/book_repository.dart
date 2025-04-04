import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/bookshelf/domain/entities/bookmark_entities.dart';
import 'package:book_app/features/bookshelf/domain/entities/feature_book_entities.dart';
import 'package:book_app/features/bookshelf/domain/entities/quotes_entities.dart';
import 'package:book_app/features/bookshelf/domain/entities/search_book_entities.dart';
import 'package:dartz/dartz.dart';

abstract class BookRepository {
  Future<Either<ServerFailure, List<FeatureBookEntities>>> getTrendingBook();
  Future<Either<ServerFailure, List<FeatureBookEntities>>> getLiteratureBook();
  Future<Either<ServerFailure, List<FeatureBookEntities>>> getTextBook();
  Future<Either<ServerFailure, List<FeatureBookEntities>>> getThrillersBook();
  Future<Either<ServerFailure, List<FeatureBookEntities>>> getRomanceBook();
  Future<Either<ServerFailure, List<FeatureBookEntities>>> getProgrammingBook();
  Future<Either<ServerFailure, QuotesEntities>> getQuotes();
  Future<Either<ServerFailure, List<SearchBookEntities>>> getSearchBook(
    String value,
  );
  Future<Either<ServerFailure, String>> addAndRemoveToBookmark(
    BookmarkEntities data,
  );
  Future<Either<ServerFailure, List<BookmarkEntities>>> getBookmark();
  Future<Either<ServerFailure, String>> getDetailBook(String value);
}
