import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/bookshelf/data/datasources/local/book_local_datasource.dart';
import 'package:book_app/features/bookshelf/data/datasources/remote/book_remote_datasource.dart';
import 'package:book_app/features/bookshelf/data/models/bookmark_models.dart';
import 'package:book_app/features/bookshelf/data/models/feature_book_models.dart';
import 'package:book_app/features/bookshelf/data/models/quotes_model.dart';
import 'package:book_app/features/bookshelf/data/models/search_book_models.dart';
import 'package:book_app/features/bookshelf/domain/entities/bookmark_entities.dart';
import 'package:book_app/features/bookshelf/domain/entities/feature_book_entities.dart';
import 'package:book_app/features/bookshelf/domain/entities/quotes_entities.dart';
import 'package:book_app/features/bookshelf/domain/entities/search_book_entities.dart';
import 'package:book_app/features/bookshelf/domain/repositories/book_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

class BookRepositoryImpl implements BookRepository {
  final BookRemoteDatasource _bookRemoteDatasource;
  final BookLocalDatasource _bookLocalDatasource;
  final Box _box;
  List<BookmarkModels> bookmarkData = [];

  BookRepositoryImpl(
    this._bookRemoteDatasource,
    this._box,
    this._bookLocalDatasource,
  );

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

  @override
  Future<Either<ServerFailure, List<SearchBookEntities>>> getSearchBook(
    String value,
  ) async {
    try {
      final response = await _bookRemoteDatasource.searchBook(value);

      final userData =
          response
              .map((e) => SearchBookModels.fromMap(e as Map<String, dynamic>))
              .toList();
      return right(userData);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, String>> addAndRemoveToBookmark(
    BookmarkEntities data,
  ) async {
    try {
      final exist = bookmarkData.any((element) => element.key == data.key);

      if (exist) {
        bookmarkData.removeWhere((element) => element.key == data.key);

        _box.put("bookmark", bookmarkData);
      } else {
        bookmarkData.add(
          BookmarkModels(
            authors: data.authors,
            description: data.description,
            fav: data.fav,
            key: data.key,
            title: data.title,
            coverI: data.coverI,
          ),
        );

        _box.put("bookmark", bookmarkData);
      }
      return right("Success save book");
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<BookmarkEntities>>> getBookmark() async {
    try {
      final response = await _bookLocalDatasource.getBookmark();

      final bookData =
          response.map((e) {
            return e as BookmarkModels;
          }).toList();

      bookmarkData = bookData;
      return right(bookmarkData);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
