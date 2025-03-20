import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/core/success/server_success.dart';
import 'package:book_app/features/auth/domain/entities/user_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Stream<User?> get credentialAuth;
  Future<Either<ServerFailure, UserEntities>> loginAuth(
    String email,
    String password,
  );
  Future<Either<ServerFailure, ServerSuccess>> signupAuth(
    String email,
    String password,
    String username,
  );
}
