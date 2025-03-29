import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class FeatureBookEntities extends Equatable {
  String? title;
  int? coverI;
  List<String>? author;
  String? key;
  bool? fav;

  FeatureBookEntities({
    this.title,
    this.coverI,
    this.author,
    this.key,
    this.fav,
  });

  @override
  List<Object?> get props => [title, coverI, author, key, fav];
}
