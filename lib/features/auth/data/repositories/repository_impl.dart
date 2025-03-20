import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/core/success/server_success.dart';
import 'package:book_app/features/auth/data/datasources/remote/remote_datasource.dart';
import 'package:book_app/features/auth/data/models/user_model.dart';
import 'package:book_app/features/auth/domain/entities/user_entities.dart';
import 'package:book_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RepositoryImpl extends AuthRepository {
  final RemoteDatasource _remoteDatasource;

  RepositoryImpl(this._remoteDatasource);

  @override
  Stream<User?> get credentialAuth => _remoteDatasource.getCredential;

  @override
  Future<Either<ServerFailure, UserEntities>> loginAuth(
    String email,
    String password,
  ) async {
    try {
      final response = await _remoteDatasource.loginAuth(email, password);

      return response.fold((l) => left(ServerFailure(message: l.message)), (r) {
        final data = r.data() as Map<String, dynamic>;

        print(r.data());

        return right(UserModel.fromMap(r.data() as Map<String, dynamic>));
      });
    } catch (e) {
      return left(ServerFailure(message: "Something went wrong"));
    }
  }

  @override
  Future<Either<ServerFailure, ServerSuccess>> signupAuth(
    String email,
    String password,
    String username,
  ) async {
    try {
      final response = await _remoteDatasource.signupAuth(
        email,
        password,
        username,
      );

      return response.fold(
        (l) => left(ServerFailure(message: l.message)),
        (r) => right(ServerSuccess(message: r.message)),
      );
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
