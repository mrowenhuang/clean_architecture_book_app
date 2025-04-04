import 'package:book_app/features/bookshelf/presentation/home_page/widgets/literature_book.dart';
import 'package:book_app/features/bookshelf/presentation/home_page/widgets/programming_book.dart';
import 'package:book_app/features/bookshelf/presentation/home_page/widgets/romance_book.dart';
import 'package:book_app/features/bookshelf/presentation/home_page/widgets/text_book.dart';
import 'package:book_app/features/bookshelf/presentation/home_page/widgets/thrillers_book.dart';
import 'package:book_app/features/bookshelf/presentation/home_page/widgets/trending_book.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'feature_state.dart';

class FeatureCubit extends Cubit<FeatureState> {
  List<Map<String, dynamic>> activeFeature = [
    {'name': 'Trending', 'results': trendingBook()},
    {'name': 'Romance', 'results': romanceBook()},
    {'name': 'Textbook', 'results': textBook()},
  ];
  List<Map<String, dynamic>> deactiveFeature = [
    {'name': 'Programming', 'results': programmingBook()},
    {'name': 'Thrillers', 'results': thrillersBook()},
    {'name': 'Literature', 'results': literatureBook()},
  ];

  FeatureCubit() : super(FeatureInitial());

  void addFeature(Map<String, dynamic> feature) {
    emit(LoadingAddandRemoveFeatureState());
    var takeDropFeature = activeFeature[0];
    deactiveFeature.remove(feature);
    deactiveFeature.add(takeDropFeature);
    activeFeature.removeAt(0);
    activeFeature.add(feature);
    emit(SuccessAddandRemoveFeatureState());
  }
}
