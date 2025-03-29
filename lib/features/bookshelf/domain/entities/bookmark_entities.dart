// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class BookmarkEntities extends Equatable {
  String? title;
  String? description;
  String? key;
  String? authors;
  String? coverI;
  bool? fav;
  BookmarkEntities({
    this.title,
    this.description,
    this.key,
    this.authors,
    this.fav,
    this.coverI,
  });

  @override
  List<Object?> get props {
    return [title, description, key, authors, fav, coverI];
  }
}
