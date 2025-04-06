import 'package:book_app/common/domain/usecase/feature_get.dart';
import 'package:book_app/common/domain/usecase/feature_save.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'feature_state.dart';

class FeatureCubit extends Cubit<FeatureState> {
  final FeatureGet _featureGet;
  final FeatureSave _featureSave;

  List<String> activeFeature = ['Trending', 'Romance', 'Textbook'];
  List<String> deactiveFeature = ['Programming', 'Thrillers', 'Literature'];
  List<String> listOfFeature = [
    'Programming',
    'Thrillers',
    'Literature',
    'Trending',
    'Romance',
    'Textbook',
  ];

  FeatureCubit(this._featureGet, this._featureSave) : super(FeatureInitial());

  void addFeature(String feature) {
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
    emit(LoadingGetFeatureState());
    final response = await _featureGet.call();

    response.fold(
      (failure) {
        emit(ErrorGetFeatureState(failure: failure.message));
      },
      (response) {
        if (response != null) {
          for (var element in response) {
            listOfFeature.remove(element);
          }
          deactiveFeature = listOfFeature;
          activeFeature = response;
          emit(SuccessGetFeatureState());
        }
        emit(SuccessGetFeatureState());
      },
    );
  }
}
