import 'package:book_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCredentials {
  final AuthRepository _authRepository;

  AuthCredentials(this._authRepository);

  Stream<User?> call() {
    return _authRepository.credentialAuth;
  }
}
