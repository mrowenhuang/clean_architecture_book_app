import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'feature_state.dart';

class FeatureCubit extends Cubit<FeatureState> {
  FeatureCubit() : super(FeatureInitial());

  void addFeature(String featureName) {
    FeatureInitial().data;    
  }

}
