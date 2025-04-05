import 'package:book_app/common/domain/usecase/feature_get.dart';
import 'package:book_app/common/domain/usecase/feature_save.dart';
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
  final FeatureGet _featureGet;
  final FeatureSave _featureSave;

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

  FeatureCubit(this._featureGet, this._featureSave) : super(FeatureInitial());

  void addFeature(Map<String, dynamic> feature) {
    emit(LoadingAddandRemoveFeatureState());
    var takeDropFeature = activeFeature[0];
    deactiveFeature.remove(feature);
    deactiveFeature.add(takeDropFeature);
    activeFeature.removeAt(0);
    activeFeature.add(feature);
    _featureSave.call(activeFeature);
    emit(SuccessAddandRemoveFeatureState());
  }

  Future loadFeature() async {
    final response = await _featureGet.call();

    print(response);
  }
}
