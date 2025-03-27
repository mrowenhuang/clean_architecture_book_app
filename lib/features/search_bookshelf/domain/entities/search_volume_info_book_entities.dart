// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SearchVolumeInfoBookEntities extends Equatable {
  String? title;
  String? subtitle;
  List<String>? authors;
  String? description;

  @override
  List<Object?> get props => [title, subtitle, authors, description];
}
