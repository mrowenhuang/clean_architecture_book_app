import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/core/success/server_success.dart';
import 'package:book_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthSignup {
  final AuthRepository _authRepository;

  AuthSignup(this._authRepository);

  Future<Either<ServerFailure, ServerSuccess>> call(
    String email,
    String password,
    String username,
  ) async {
    return _authRepository.signupAuth(email, password, username);
  }
}
