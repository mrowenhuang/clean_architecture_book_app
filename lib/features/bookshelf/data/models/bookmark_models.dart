// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

import 'package:book_app/features/bookshelf/domain/entities/bookmark_entities.dart';

part 'bookmark_models.g.dart';

@HiveType(typeId: 1)
// ignore: must_be_immutable
class BookmarkModels extends BookmarkEntities {
  @override
  @HiveField(0)
  final String? title;
  @override
  @HiveField(1)
  final String? description;
  @override
  @HiveField(2)
  final String? key;
  @override
  @HiveField(3)
  final String? authors;
  @override
  @HiveField(4)
  final bool? fav;
  @override
  @HiveField(5)
  final String? coverI;

  BookmarkModels({
    this.title,
    this.description,
    this.key,
    this.authors,
    this.fav,
    this.coverI
  }) : super(
         authors: authors,
         description: description,
         fav: fav,
         key: key,
         title: title,
         coverI: coverI,
       );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'key': key,
      'authors': authors,
      'fav': fav,
      'cover_I': coverI,
    };
  }

  factory BookmarkModels.fromMap(Map<String, dynamic> map) {
    return BookmarkModels(
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      key: map['key'] != null ? map['key'] as String : null,
      authors: map['authors'] != null ? map['authors'] as String : null,
      fav: map['fav'] != null ? map['fav'] as bool : null,
      coverI: map['cover_I'] != null ? map['cover_I'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookmarkModels.fromJson(String source) =>
      BookmarkModels.fromMap(json.decode(source) as Map<String, dynamic>);
}
