part of 'indicator_cubit.dart';

sealed class IndicatorState extends Equatable {
  final List<Map<String, String>> feature = [
    {'name': "Trending"},
    {'name': "Romance"},
    {'name': "Textbook"},
  ];
}

final class IndicatorInitial extends IndicatorState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class ActiveIndicatorState extends IndicatorState {
  final int activeVal;

  ActiveIndicatorState(this.activeVal);

  @override
  // TODO: implement props
  List<Object?> get props => [activeVal];
}

final class SuccessAddFeatureState extends IndicatorState {

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
