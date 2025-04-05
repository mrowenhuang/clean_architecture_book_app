import 'package:book_app/features/bookshelf/presentation/home_page/widgets/literature_book.dart';
import 'package:book_app/features/bookshelf/presentation/home_page/widgets/programming_book.dart';
import 'package:book_app/features/bookshelf/presentation/home_page/widgets/romance_book.dart';
import 'package:book_app/features/bookshelf/presentation/home_page/widgets/text_book.dart';
import 'package:book_app/features/bookshelf/presentation/home_page/widgets/thrillers_book.dart';
import 'package:book_app/features/bookshelf/presentation/home_page/widgets/trending_book.dart';
import 'package:flutter/material.dart';

Widget featureSwitch(String name) {
  switch (name) {
    case 'Trending':
      return trendingBook();
    case 'Romance':
      return romanceBook();
    case 'Textbook':
      return textBook();
    case 'Programming':
      return programmingBook();
    case 'Thrillers':
      return thrillersBook();
    case 'Literature':
      return literatureBook();
    default:
      return SizedBox();
  }
}