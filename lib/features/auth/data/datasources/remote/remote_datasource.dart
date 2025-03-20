import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/core/success/server_success.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RemoteDatasource {
  Stream<User?> get getCredential;
  Future<Either<ServerFailure, DocumentSnapshot>> loginAuth(
    String email,
    String password,
  );
  Future<Either<ServerFailure, ServerSuccess>> signupAuth(
    String email,
    String password,
    String username,
  );
  Future<void> addAuthData(
    String id,
    String email,
    String created,
    String username,
  );
  Future<DocumentSnapshot> getAuthData(String id);
}

class RemoteDatasourceImpl extends RemoteDatasource {
  final FirebaseFirestore _firestore;

  RemoteDatasourceImpl(this._firestore);

  @override
  // TODO: implement getCredential
  Stream<User?> get getCredential => FirebaseAuth.instance.authStateChanges();

  @override
  Future<Either<ServerFailure, DocumentSnapshot>> loginAuth(
    String email,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userData = credential.user;

      try {
        final data = await getAuthData(userData!.uid);

        return right(data);
      } catch (e) {
        return left(ServerFailure(message: e.toString()));
      }
    } on FirebaseAuthException catch (e) {
      return left(ServerFailure(message: e.code));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, ServerSuccess>> signupAuth(
    String email,
    String password,
    String username,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final userData = credential.user;
      try {
        await addAuthData(
          userData!.uid,
          email,
          userData.metadata.creationTime.toString(),
          username,
        );
        return right(ServerSuccess(message: "success"));
      } catch (e) {
        return left(ServerFailure(message: e.toString()));
      }
    } on FirebaseAuthException catch (e) {
      return left(ServerFailure(message: e.code));
    } catch (e) {
      return left(ServerFailure(message: "Something Wrong"));
    }
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
