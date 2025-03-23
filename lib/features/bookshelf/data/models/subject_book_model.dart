import 'dart:convert';

import 'package:book_app/features/bookshelf/domain/entities/subject_book_entities.dart';

// ignore: must_be_immutable
class SubjectBookModel extends SubjectBookEntities {
  SubjectBookModel({super.authors, super.coverId, super.key, super.title});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'key': key,
      'cover_id': coverId,
      'authors': authors,
    };
  }

  factory SubjectBookModel.fromMap(Map<String, dynamic> map) {
    return SubjectBookModel(
      title: map['title'] != null ? map['title'] as String : null,
      key: map['key'] != null ? map['key'] as String : null,
      coverId: map['cover_id'] != null ? map['cover_id'] as int : null,
      authors: map['authors'] != null
    ? List<Map<String, dynamic>>.from(map['authors'] as List<dynamic>)
    : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectBookModel.fromJson(String source) =>
      SubjectBookModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
