import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SubjectBookEntities extends Equatable {
  String? title;
  String? key;
  int? coverId;
  List<dynamic>? authors;

  SubjectBookEntities({this.title, this.key, this.coverId, this.authors});

  @override
  List<Object?> get props => [title, key, coverId, authors];
}
