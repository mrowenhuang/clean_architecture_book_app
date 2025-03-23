import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/bookshelf/domain/entities/feature_book_entities.dart';
import 'package:book_app/features/bookshelf/domain/entities/quotes_entities.dart';
import 'package:book_app/features/bookshelf/domain/entities/subject_book_entities.dart';
import 'package:dartz/dartz.dart';

abstract class BookRepository {
  Future<Either<ServerFailure, List<FeatureBookEntities>>> getTrendingBook();
  Future<Either<ServerFailure, List<SubjectBookEntities>>> getLiteratureBook();
  Future<Either<ServerFailure, List<SubjectBookEntities>>> getTextBook();
  Future<Either<ServerFailure, List<SubjectBookEntities>>> getThrillersBook();
  Future<Either<ServerFailure, List<SubjectBookEntities>>> getRomanceBook();
  Future<Either<ServerFailure, List<SubjectBookEntities>>> getProgrammingBook();
  Future<Either<ServerFailure,QuotesEntities>> getQuotes();
}
