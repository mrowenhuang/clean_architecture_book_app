import 'dart:convert';

import 'package:book_app/features/auth/domain/entities/user_entities.dart';

// ignore: must_be_immutable
class UserModel extends UserEntities {
  UserModel({
    super.username,
    super.email,
    super.id,
    super.createdAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      "id" : id,
      "created_at" : createdAt
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] as String,
      email: map['email'] as String,
      id: map['id'] as String,
      createdAt : map['created_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
