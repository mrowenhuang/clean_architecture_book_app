import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/bookshelf/domain/entities/bookmark_entities.dart';
import 'package:book_app/features/bookshelf/domain/repositories/book_repository.dart';
import 'package:dartz/dartz.dart';

class BookmarkAddAndRemove {
  final BookRepository _bookRepository;

  BookmarkAddAndRemove(this._bookRepository);

  Future<Either<ServerFailure, String>> call(BookmarkEntities data) async {
    return await _bookRepository.addAndRemoveToBookmark(data);
  }
}
