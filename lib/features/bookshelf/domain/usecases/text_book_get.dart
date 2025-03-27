import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/bookshelf/domain/entities/feature_book_entities.dart';
import 'package:book_app/features/bookshelf/domain/repositories/book_repository.dart';
import 'package:dartz/dartz.dart';

class TextBookGet {
  final BookRepository _bookRepository;

  const TextBookGet(this._bookRepository);

  Future<Either<ServerFailure, List<FeatureBookEntities>>> call() async {
    return await _bookRepository.getTextBook();
  }
}
