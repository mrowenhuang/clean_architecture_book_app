import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'indicator_state.dart';

class IndicatorCubit extends Cubit<IndicatorState> {
  IndicatorCubit() : super(ActiveIndicatorState(0));

  void setActiveIndicatorValue(int val) {
    emit(ActiveIndicatorState(val));
  }

  void addFeature(Map<String, String> data) { 
    // SuccessAddFeatureState().feature
  }
}
