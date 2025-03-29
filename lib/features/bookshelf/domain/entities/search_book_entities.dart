// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:book_app/features/bookshelf/domain/entities/search_volume_info_book_entities.dart';

// ignore: must_be_immutable
class SearchBookEntities extends Equatable {
  String? id;
  bool? fav;
  SearchVolumeInfoBookEntities? volumeInfo;
  SearchBookEntities({this.id, this.volumeInfo, this.fav});

  @override
  List<Object?> get props => [id, volumeInfo, fav];
}
