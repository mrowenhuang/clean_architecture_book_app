part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

final class LoadingLoginAuthState extends AuthState {}

final class LoadingSignupAuthState extends AuthState {}

final class SuccessLoginAuthState extends AuthState {
  final UserEntities user;

  const SuccessLoginAuthState({required this.user});

}

final class SuccessSignupAuthState extends AuthState {}

final class ErrorLoginAuthState extends AuthState {
  final String message;

  const ErrorLoginAuthState({required this.message});
}

final class ErrorSignupAuthState extends AuthState {
  final String message;

  const ErrorSignupAuthState({required this.message});
}
