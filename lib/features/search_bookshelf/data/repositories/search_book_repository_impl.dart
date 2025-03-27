import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/search_bookshelf/data/datasources/remote/search_book_datasource.dart';
import 'package:book_app/features/search_bookshelf/data/models/search_book_models.dart';
import 'package:book_app/features/search_bookshelf/domain/entities/search_book_entities.dart';
import 'package:book_app/features/search_bookshelf/domain/repositories/search_book_repository.dart';
import 'package:dartz/dartz.dart';

class SearchBookRepositoryImpl implements SearchBookRepository {
  final SearchBookDatasource _searchBookDatasource;

  SearchBookRepositoryImpl(this._searchBookDatasource);

  @override
  Future<Either<ServerFailure, List<SearchBookEntities>>> getSearchBook(
    String value,
  ) async {
    try {
      final response = await _searchBookDatasource.searchBook(value);

      final userData =
          response
              .map((e) => SearchBookModels.fromMap(e as Map<String, dynamic>))
              .toList();
      print(userData);
      return right(userData);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
