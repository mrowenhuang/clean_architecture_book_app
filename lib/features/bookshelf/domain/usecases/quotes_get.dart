import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/bookshelf/domain/entities/quotes_entities.dart';
import 'package:book_app/features/bookshelf/domain/repositories/book_repository.dart';
import 'package:dartz/dartz.dart';

class QuotesGet {
  final BookRepository _bookRepository;

  QuotesGet(this._bookRepository);

  Future<Either<ServerFailure, QuotesEntities>> call() async {
    return await _bookRepository.getQuotes();
  }
}
