// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SearchVolumeInfoBookEntities extends Equatable {
  String? title;
  String? subtitle;
  List<String>? authors;
  String? description;
  SearchVolumeInfoBookEntities({
    this.title,
    this.subtitle,
    this.authors,
    this.description,
  });

  @override
  List<Object?> get props => [title, subtitle, authors, description];


}
