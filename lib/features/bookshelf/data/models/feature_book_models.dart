import 'dart:convert';

import 'package:book_app/features/bookshelf/domain/entities/feature_book_entities.dart';

// ignore: must_be_immutable
class FeatureBookModels extends FeatureBookEntities {
  FeatureBookModels({super.author, super.coverI, super.key, super.title});

Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'cover_i': coverI,
      'author_name': author,
      'key': key,
    };
  }

  factory FeatureBookModels.fromMap(Map<String, dynamic> map) {
    return FeatureBookModels(
      title: map['title'] != null ? map['title'] as String : null,
      coverI: map['cover_i'] != null ? map['cover_i'] as int : null,
      author: map['author_name'] != null ? List<String>.from((map['author_name'] as List)) : null,
      key: map['key'] != null ? map['key'] as String : null,
    );
  }
    
  String toJson() => json.encode(toMap());

  factory FeatureBookModels.fromJson(String source) => FeatureBookModels.fromMap(json.decode(source) as Map<String, dynamic>);
}
