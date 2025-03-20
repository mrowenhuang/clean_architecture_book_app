part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();  

  @override
  List<Object> get props => [];
}
class AuthInitial extends AuthState {}

final class LoadingAuthState extends AuthState {}

final class SuccessLoginAuthState extends AuthState {}
final class SuccessSignupAuthState extends AuthState {}

final class ErrorLoginAuthState extends AuthState {}
final class ErrorSignupAuthState extends AuthState {}
