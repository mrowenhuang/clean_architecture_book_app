// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class BookEntities extends Equatable {
  String? title;
  int? coverI;
  List<String>? author;
  String? key;

  BookEntities({this.title, this.coverI, this.author, this.key});

  @override
  List<Object?> get props => [title, coverI, author, key];

  
}
