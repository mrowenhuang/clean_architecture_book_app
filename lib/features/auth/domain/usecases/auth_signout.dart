import 'package:book_app/features/auth/domain/repositories/auth_repository.dart';

class AuthSignout {
  final AuthRepository _authRepository;

  AuthSignout(this._authRepository);


  Future<void> call () async {
    await _authRepository.signoutAuth();
  }

}
