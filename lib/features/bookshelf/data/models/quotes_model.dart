import 'dart:convert';

import 'package:book_app/features/bookshelf/domain/entities/quotes_entities.dart';

// ignore: must_be_immutable
class QuotesModel extends QuotesEntities {
  QuotesModel({super.author, super.id, super.quote});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'quote': quote, 'author': author};
  }

  factory QuotesModel.fromMap(Map<String, dynamic> map) {
    return QuotesModel(
      id: map['id'] != null ? map['id'] as int : null,
      quote: map['quote'] != null ? map['quote'] as String : null,
      author: map['author'] != null ? map['author'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuotesModel.fromJson(String source) =>
      QuotesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
