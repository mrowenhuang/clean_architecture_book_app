import 'dart:convert';

import 'package:book_app/features/bookshelf/data/models/search_volume_info_book_models.dart';
import 'package:book_app/features/bookshelf/domain/entities/search_book_entities.dart';

// ignore: must_be_immutable
class SearchBookModels extends SearchBookEntities {
  SearchBookModels({super.id, super.volumeInfo, super.fav});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'volumeInfo': SearchVolumeInfoBookModels().toMap(),
      'fav' : fav,
    };
  }

  factory SearchBookModels.fromMap(Map<String, dynamic> map) {
    return SearchBookModels(
      id: map['id'] != null ? map['id'] as String : null,
      volumeInfo:
          map['volumeInfo'] != null
              ? SearchVolumeInfoBookModels.fromMap(
                map['volumeInfo'] as Map<String, dynamic>,
              )
              : null,
      fav: map['fav'] ?? false
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchBookModels.fromJson(String source) =>
      SearchBookModels.fromMap(json.decode(source) as Map<String, dynamic>);
}
