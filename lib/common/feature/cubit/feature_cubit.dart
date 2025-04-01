import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'feature_state.dart';

class FeatureCubit extends Cubit<FeatureState> {

  List activeFeature = ['Trending','Romance','Textbook'];
  List deactiveFeature = ['Clasics','Kids','Thrillers'];


  FeatureCubit() : super(FeatureInitial());

  void addFeature (String feature) {
    activeFeature.removeAt(0);
    activeFeature.add(feature);
  }
  
}
