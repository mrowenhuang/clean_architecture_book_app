
import 'package:book_app/core/failure/server_failure.dart';
import 'package:dartz/dartz.dart';

abstract class CommonRepositories {
  void saveFeature(List<String> data);
  Future<Either<ServerFailure,List<String>?>> getFeature();
}
