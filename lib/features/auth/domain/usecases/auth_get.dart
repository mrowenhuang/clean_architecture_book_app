import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/auth/domain/entities/user_entities.dart';
import 'package:book_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthGet {
  final AuthRepository _authRepository;

  AuthGet(this._authRepository);

  Future<Either<ServerFailure, UserEntities>> call(String id) async {
    return await _authRepository.getAuth(id);
  }
}
