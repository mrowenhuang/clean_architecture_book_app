import 'package:book_app/core/failure/server_failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDatasource {
  Stream<User?> get getCredential;
  Future<Either<ServerFailure, UserCredential>> loginAuth(
    String email,
    String password,
  );
  Future<Either<ServerFailure, UserCredential>> signupAuth(
    String email,
    String password,
    String username,
  );
  Future<void> signoutAuth();
  Future<void> addAuthData(
    String id,
    String email,
    String created,
    String username,
  );
  Future<DocumentSnapshot> getAuthData(String id);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  AuthRemoteDatasourceImpl(this._firestore, this._firebaseAuth);

  @override
  // TODO: implement getCredential
  Stream<User?> get getCredential => _firebaseAuth.authStateChanges();

  @override
  Future<Either<ServerFailure, UserCredential>> loginAuth(
    String email,
    String password,
  ) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(credential);
    } on FirebaseAuthException catch (e) {
      return left(ServerFailure(message: e.code));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, UserCredential>> signupAuth(
    String email,
    String password,
    String username,
  ) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return right(credential);
    } on FirebaseAuthException catch (e) {
      return left(ServerFailure(message: e.code));
    } catch (e) {
      return left(ServerFailure(message: "Something Wrong"));
    }
  }

  @override
  Future<void> signoutAuth() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> addAuthData(
    String id,
    String email,
    String created,
    String username,
  ) async {
    DocumentReference documentReference = _firestore
        .collection("users")
        .doc(id);
    try {
      await documentReference.set({
        "id": id,
        "username": username,
        "email": email,
        "created_at": created,
      });
    } catch (e) {
      throw ServerFailure(message: "Something Wrong");
    }
  }

  @override
  Future<DocumentSnapshot> getAuthData(String id) async {
    CollectionReference collectionReference = _firestore.collection("users");
    try {
      final data = await collectionReference.doc(id).get();
      return data;
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }
}
