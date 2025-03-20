import 'package:book_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCredential {
  final AuthRepository _authRepository;

  AuthCredential(this._authRepository);

  Stream<User?> call() {
    return _authRepository.credentialAuth;
  }
}
