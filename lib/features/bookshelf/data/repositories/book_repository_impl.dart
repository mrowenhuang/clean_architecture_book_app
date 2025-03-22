import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/bookshelf/data/datasources/remote/remote_datasource.dart';
import 'package:book_app/features/bookshelf/data/models/book_models.dart';
import 'package:book_app/features/bookshelf/domain/entities/book_entities.dart';
import 'package:book_app/features/bookshelf/domain/repositories/book_repository.dart';
import 'package:dartz/dartz.dart';

class BookRepositoryImpl extends BookRepository {
  final RemoteDatasource _remoteDatasource;

  BookRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<ServerFailure, List<BookEntities>>> getTrendingBook() async {
    try {
      final response = await _remoteDatasource.getTrendingBook();

      // print(response);
      final userData = response.map((e) => BookModels.fromMap(e)).toList();

      print(userData);

      return right(userData);
    } catch (e) {
      print(e);
      return left(ServerFailure(message: e.toString()));
    }
  }
}
