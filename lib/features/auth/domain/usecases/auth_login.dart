import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthLogin {
  final AuthRepository _authRepository;

  AuthLogin(this._authRepository);

  Future<Either<ServerFailure, UserCredential>> call(
    String email,
    String password,
  ) async {
    return await _authRepository.loginAuth(email, password);
  }
}
