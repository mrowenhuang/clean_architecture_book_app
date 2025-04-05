part of 'feature_cubit.dart';

sealed class FeatureState extends Equatable {
  const FeatureState();

  @override
  List<Object> get props => [];
}

final class FeatureInitial extends FeatureState {
  
}

final class SuccessAddandRemoveFeatureState extends FeatureState {}

final class LoadingAddandRemoveFeatureState extends FeatureState {}

final class LoadingGetFeatureState extends FeatureState {}

final class SuccessGetFeatureState extends FeatureState {

}

final class ErrorGetFeatureState extends FeatureState {
  final String failure;

  const ErrorGetFeatureState({required this.failure});
}