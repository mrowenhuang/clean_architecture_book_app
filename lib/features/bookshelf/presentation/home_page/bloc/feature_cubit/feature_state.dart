part of 'feature_cubit.dart';

sealed class FeatureState extends Equatable {
  const FeatureState();

  @override
  List<Object> get props => [];
}

final class FeatureInitial extends FeatureState {
  final List<Map<String, String>> data = [
    {"feature": "Trending"},
    {"feature": "Romance"},
    {"feature": "Textbook"},
  ];
}
