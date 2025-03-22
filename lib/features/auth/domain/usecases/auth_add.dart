import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/auth/domain/repositories/auth_repository.dart';

class AuthAdd {
  final AuthRepository _authRepository;

  AuthAdd(this._authRepository);

  Future<ServerFailure> call(
    String id,
    String email,
    String username,
    String created,
  ) async {
    return await _authRepository.addAuth(
      id,
      email,
      username,
      created,
    );
  }
}
