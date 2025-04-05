import 'package:book_app/common/domain/repositories/common_repositories.dart';
import 'package:book_app/core/failure/server_failure.dart';
import 'package:dartz/dartz.dart';

class FeatureGet {
  final CommonRepositories _commonRepositories;

  FeatureGet(this._commonRepositories);

  Future<Either<ServerFailure,List<String>?>> call() async {
    return await _commonRepositories.getFeature();
  }
}
