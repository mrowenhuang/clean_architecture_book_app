import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:book_app/features/auth/data/models/user_model.dart';
import 'package:book_app/features/auth/domain/entities/user_entities.dart';
import 'package:book_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RepositoryImpl extends AuthRepository {
  final AuthRemoteDatasource _authRemoteDatasource;

  RepositoryImpl(this._authRemoteDatasource);

  @override
  Stream<User?> get credentialAuth => _authRemoteDatasource.getCredential;

  @override
  Future<Either<ServerFailure, UserCredential>> loginAuth(
    String email,
    String password,
  ) async {
    try {
      final response = await _authRemoteDatasource.loginAuth(email, password);

      return response.fold(
        (l) => left(ServerFailure(message: l.message)),
        (r) => right(r),
      );
    } catch (e) {
      return left(ServerFailure(message: "Something went wrong"));
    }
  }

  @override
  Future<Either<ServerFailure, UserCredential>> signupAuth(
    String email,
    String password,
    String username,
  ) async {
    try {
      final response = await _authRemoteDatasource.signupAuth(
        email,
        password,
        username,
      );
      return response.fold(
        (l) => left(ServerFailure(message: l.message)),
        (r) => right(r),
      );
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<void> signoutAuth() async {
    await _authRemoteDatasource.signoutAuth();
  }

  @override
  Future<Either<ServerFailure, UserEntities>> getAuth(String id) async {
    try {
      final response = await _authRemoteDatasource.getAuthData(id);

      final userData = response.data() as Map<String, dynamic>;

      return right(UserModel.fromMap(userData));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<ServerFailure> addAuth(
    String id,
    String email,
    String username,
    String created,
  ) async {
    try {
      await _authRemoteDatasource.addAuthData(id, email, created, username);
      throw ServerFailure(message: "Failed Add Data");
    } catch (e) {
      return ServerFailure(message: e.toString());
    }
  }
}
