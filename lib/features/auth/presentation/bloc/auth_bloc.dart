import 'dart:async';

import 'package:book_app/features/auth/domain/entities/user_entities.dart';
import 'package:book_app/features/auth/domain/usecases/auth_add.dart';
import 'package:book_app/features/auth/domain/usecases/auth_credential.dart';
import 'package:book_app/features/auth/domain/usecases/auth_get.dart';
import 'package:book_app/features/auth/domain/usecases/auth_login.dart';
import 'package:book_app/features/auth/domain/usecases/auth_signup.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthLogin _authLogin;
  final AuthSignup _authSignup;
  final AuthCredentials _authCredential;
  final AuthGet _authGet;
  final AuthAdd _authAdd;

  AuthBloc(
    this._authLogin,
    this._authSignup,
    this._authCredential,
    this._authGet,
    this._authAdd,
  ) : super(AuthInitial()) {
    on<LoginClickAuthEvent>(loginClickAuthEvent);
    on<SignupClickAuthEvent>(signupClickAuthEvent);
    on<CredentialAuthClickEvent>(credentialAuthClickEvent);
  }

  FutureOr<void> loginClickAuthEvent(
    LoginClickAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoadingLoginAuthState());
    final response = await _authLogin.call(event.email, event.password);
    await response.fold(
      (failure) {
        emit(ErrorLoginAuthState(message: failure.message));
      },
      (response2) async {
        final userData = await _authGet.call(response2.user!.uid);
        await userData.fold(
          (failure) async {
            emit(ErrorLoginAuthState(message: failure.message));
          },
          (response) async {
            emit(SuccessLoginAuthState(user: response));
          },
        );
      },
    );
  }

  FutureOr<void> signupClickAuthEvent(
    SignupClickAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoadingSignupAuthState());
    final response = await _authSignup.call(
      event.email,
      event.password,
      event.username,
    );
    await response.fold(
      (failure) async {
        emit(ErrorSignupAuthState(message: failure.message));
      },
      (response) async {
        try {
          await _authAdd.call(
            response.user!.uid,
            event.email,
            event.username,
            response.user!.metadata.creationTime!.toIso8601String(),
          );
          emit(
            SuccessSignupAuthState(
              user: UserEntities(
                createdAt:
                    response.user!.metadata.creationTime!.toIso8601String(),
                email: event.email,
                id: response.user!.uid,
                username: event.username,
              ),
            ),
          );
        } catch (e) {
          emit(ErrorSignupAuthState(message: e.toString()));
        }
      },
    );
  }

  FutureOr<void> credentialAuthClickEvent(
    CredentialAuthClickEvent event,
    Emitter<AuthState> emit,
  ) async {
    await for (var authEvent in _authCredential.call()) {
      if (authEvent != null) {
        final userData = await _authGet.call(authEvent.uid);
        await userData.fold(
          (failure) async {
            emit(FailedCredentialAuthState());
          },
          (response) async {
            emit(SuccessLoginAuthState(user: response));
          },
        );
      } else {
        emit(FailedCredentialAuthState());
      }
    }
  }
}
