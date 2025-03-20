import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserEntities extends Equatable {
  String? username;
  String? email;
  String? id;
  String? createdAt;

  UserEntities({this.username, this.email, this.id, this.createdAt});

  @override
  List<Object?> get props => [username, email, id, createdAt];
}
