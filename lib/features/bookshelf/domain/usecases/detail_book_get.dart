import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/bookshelf/domain/repositories/book_repository.dart';
import 'package:dartz/dartz.dart';

class DetailBookGet {
  final BookRepository _bookRepository;

  DetailBookGet(this._bookRepository);

  Future<Either<ServerFailure, String>> call(String value) async {
    return await _bookRepository.getDetailBook(value);
  }
}
