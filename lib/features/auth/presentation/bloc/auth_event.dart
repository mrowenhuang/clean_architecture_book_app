part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class LoginClickAuthEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginClickAuthEvent({required this.email, required this.password});
}

final class SignupClickAuthEvent extends AuthEvent {
  final String email;
  final String password;
  final String username;

  const SignupClickAuthEvent({
    required this.email,
    required this.password,
    required this.username,
  });
}

final class CredentialAuthClickEvent extends AuthEvent {}
