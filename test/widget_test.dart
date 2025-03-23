// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:book_app/features/bookshelf/data/datasources/remote/remote_datasource.dart';
import 'package:book_app/features/bookshelf/data/repositories/book_repository_impl.dart';
import 'package:book_app/features/bookshelf/domain/repositories/book_repository.dart';
import 'package:book_app/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // await RemoteDatasourceImpl().getTrendingBook();
  final resp = await BookRepositoryImpl(RemoteDatasourceImpl()).getQuotes();

  resp.fold((l) {
    print(l.message);
  }, (r) {
    print(r);
  },);

  // await RemoteDatasourceImpl(FirebaseFirestore.instance).addAuthData("owen@gmail.com", "12312", "owen");
}
