import 'dart:convert';

import 'package:book_app/features/search_bookshelf/domain/entities/search_volume_info_book_entities.dart';

class SearchVolumeInfoBookModels extends SearchVolumeInfoBookEntities {
  SearchVolumeInfoBookModels({
    super.authors,
    super.description,
    super.subtitle,
    super.title,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'subtitle': subtitle,
      'authors': authors,
      'description': description,
    };
  }

  factory SearchVolumeInfoBookModels.fromMap(Map<String, dynamic> map) {
    return SearchVolumeInfoBookModels(
      title: map['title'] != null ? map['title'] as String : null,
      subtitle: map['subtitle'] != null ? map['subtitle'] as String : null,
      authors:
          map['authors'] != null ? List<String>.from((map['authors'] as List)) : null,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchVolumeInfoBookModels.fromJson(String source) =>
      SearchVolumeInfoBookModels.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
