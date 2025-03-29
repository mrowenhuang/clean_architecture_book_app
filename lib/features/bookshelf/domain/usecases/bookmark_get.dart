import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/bookshelf/domain/entities/bookmark_entities.dart';
import 'package:book_app/features/bookshelf/domain/repositories/book_repository.dart';
import 'package:dartz/dartz.dart';

class BookmarkGet {
  final BookRepository _bookRepository;

  BookmarkGet(this._bookRepository);

  Future<Either<ServerFailure, List<BookmarkEntities>>> call() async {
    return await _bookRepository.getBookmark();
  }
}
