// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:book_app/features/search_bookshelf/domain/entities/search_volume_info_book_entities.dart';

class SearchBookEntities extends Equatable {
  String? id;
  SearchVolumeInfoBookEntities? volumeInfo;
  SearchBookEntities({
    this.id,
    this.volumeInfo,
  });

  @override
  List<Object?> get props => [id,volumeInfo];


}
