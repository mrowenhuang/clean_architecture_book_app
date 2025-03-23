import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class QuotesEntities extends Equatable {
  String? quote;
  String? author;
  QuotesEntities({this.quote, this.author});

  @override
  List<Object?> get props => [quote, author];
}
