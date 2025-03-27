import 'dart:convert';

import 'package:book_app/features/search_bookshelf/data/models/search_volume_info_book_models.dart';
import 'package:book_app/features/search_bookshelf/domain/entities/search_book_entities.dart';

class SearchBookModels extends SearchBookEntities {
  SearchBookModels({super.id, super.volumeInfo});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'volumeInfo': SearchVolumeInfoBookModels().toMap()};
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
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchBookModels.fromJson(String source) =>
      SearchBookModels.fromMap(json.decode(source) as Map<String, dynamic>);
}
