import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/bookshelf/data/datasources/remote/book_remote_datasource.dart';
import 'package:book_app/features/bookshelf/data/models/feature_book_models.dart';
import 'package:book_app/features/bookshelf/data/models/quotes_model.dart';
import 'package:book_app/features/bookshelf/domain/entities/feature_book_entities.dart';
import 'package:book_app/features/bookshelf/domain/entities/quotes_entities.dart';
import 'package:book_app/features/bookshelf/domain/repositories/book_repository.dart';
import 'package:dartz/dartz.dart';

class BookRepositoryImpl extends BookRepository {
  final BookRemoteDatasource _bookRemoteDatasource;

  BookRepositoryImpl(this._bookRemoteDatasource);

  @override
  Future<Either<ServerFailure, List<FeatureBookEntities>>>
  getTrendingBook() async {
    try {
      final response = await _bookRemoteDatasource.getTrendingBook();
      final userData =
          response.map((e) => FeatureBookModels.fromMap(e)).toList();
      return right(userData);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<FeatureBookEntities>>>
  getLiteratureBook() async {
    try {
      final response = await _bookRemoteDatasource.getLiteratureBook();
      final userData =
          response.map((e) => FeatureBookModels.fromMap(e)).toList();
      return right(userData);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<FeatureBookEntities>>>
  getProgrammingBook() async {
    try {
      final response = await _bookRemoteDatasource.getProgrammingBook();
      final userData =
          response.map((e) => FeatureBookModels.fromMap(e)).toList();
      return right(userData);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<FeatureBookEntities>>>
  getRomanceBook() async {
    try {
      final response = await _bookRemoteDatasource.getRomanceBook();
      final userData =
          response.map((e) => FeatureBookModels.fromMap(e)).toList();
      return right(userData);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<FeatureBookEntities>>> getTextBook() async {
    try {
      final response = await _bookRemoteDatasource.getTextBook();
      final userData =
          response.map((e) => FeatureBookModels.fromMap(e)).toList();
      return right(userData);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<FeatureBookEntities>>>
  getThrillersBook() async {
    try {
      final response = await _bookRemoteDatasource.getThrillersBook();
      final userData =
          response.map((e) => FeatureBookModels.fromMap(e)).toList();
      return right(userData);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, QuotesEntities>> getQuotes() async {
    try {
      final response = await _bookRemoteDatasource.getQuotes();
      return right(QuotesModel.fromMap(response));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
