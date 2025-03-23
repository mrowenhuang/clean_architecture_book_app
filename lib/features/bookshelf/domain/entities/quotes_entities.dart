import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class QuotesEntities extends Equatable {
  int? id;
  String? quote;
  String? author;
  QuotesEntities({this.id, this.quote, this.author});

  @override
  List<Object?> get props => [id, quote, author];
}
