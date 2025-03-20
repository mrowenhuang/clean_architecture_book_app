import 'dart:async';

import 'package:book_app/features/auth/domain/usecases/auth_credential.dart';
import 'package:book_app/features/auth/domain/usecases/auth_login.dart';
import 'package:book_app/features/auth/domain/usecases/auth_signup.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthLogin _authLogin;
  final AuthSignup _authSignup;
  final AuthCredential _authCredential;

  AuthBloc(this._authLogin, this._authSignup, this._authCredential)
    : super(AuthInitial()) {
    on<LoginClickAuthEvent>(loginClickAuthEvent);
    on<SignupClickAuthEvent>(signupClickAuthEvent);
  }

  FutureOr<void> loginClickAuthEvent(
    LoginClickAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    final response = await _authLogin.call(event.email, event.password);

    response.fold(
      (l) {
        print(l.message);
      },
      (r) {
        print(r);
      },
    );
  }

  FutureOr<void> signupClickAuthEvent(
    SignupClickAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    final response = await _authSignup.call(
      event.email,
      event.password,
      event.username,
    );

    response.fold(
      (l) {
        print(l.message);
      },
      (r) {
        print(r);
      },
    );
  }
}
