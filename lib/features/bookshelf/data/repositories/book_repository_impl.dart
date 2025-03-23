import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/bookshelf/data/datasources/remote/remote_datasource.dart';
import 'package:book_app/features/bookshelf/data/models/feature_book_models.dart';
import 'package:book_app/features/bookshelf/data/models/quotes_model.dart';
import 'package:book_app/features/bookshelf/data/models/subject_book_model.dart';
import 'package:book_app/features/bookshelf/domain/entities/feature_book_entities.dart';
import 'package:book_app/features/bookshelf/domain/entities/quotes_entities.dart';
import 'package:book_app/features/bookshelf/domain/entities/subject_book_entities.dart';
import 'package:book_app/features/bookshelf/domain/repositories/book_repository.dart';
import 'package:dartz/dartz.dart';

class BookRepositoryImpl extends BookRepository {
  final RemoteDatasource _remoteDatasource;

  BookRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<ServerFailure, List<FeatureBookEntities>>>
  getTrendingBook() async {
    try {
      final response = await _remoteDatasource.getTrendingBook();
      final userData =
          response.map((e) => FeatureBookModels.fromMap(e)).toList();
      return right(userData);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<SubjectBookEntities>>>
  getLiteratureBook() async {
    try {
      final response = await _remoteDatasource.getLiteratureBook();
      final userData =
          response.map((e) => SubjectBookModel.fromMap(e)).toList();
      return right(userData);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<SubjectBookEntities>>>
  getProgrammingBook() async {
    try {
      final response = await _remoteDatasource.getProgrammingBook();
      final userData =
          response.map((e) => SubjectBookModel.fromMap(e)).toList();
      return right(userData);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<SubjectBookEntities>>>
  getRomanceBook() async {
    try {
      final response = await _remoteDatasource.getRomanceBook();
      final userData =
          response.map((e) => SubjectBookModel.fromMap(e)).toList();
      return right(userData);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<SubjectBookEntities>>> getTextBook() async {
    try {
      final response = await _remoteDatasource.getTextBook();
      final userData =
          response.map((e) => SubjectBookModel.fromMap(e)).toList();
      return right(userData);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<SubjectBookEntities>>>
  getThrillersBook() async {
    try {
      final response = await _remoteDatasource.getThrillersBook();
      final userData =
          response.map((e) => SubjectBookModel.fromMap(e)).toList();
      return right(userData);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, QuotesEntities>> getQuotes() async {
    try {
      final response = await _remoteDatasource.getQuotes();
      return right(QuotesModel.fromMap(response));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
