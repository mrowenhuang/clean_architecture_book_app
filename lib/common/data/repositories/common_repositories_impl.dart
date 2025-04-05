import 'package:book_app/common/data/datasources/local/common_local_datasources.dart';
import 'package:book_app/common/domain/repositories/common_repositories.dart';
import 'package:book_app/core/failure/server_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CommonRepositoriesImpl implements CommonRepositories {
  final CommonLocalDatasources _commonLocalDatasources;

  CommonRepositoriesImpl(this._commonLocalDatasources);

  @override
  void saveFeature(List<String> data) async {
    final Box box = await Hive.openBox('feature');

    box.put('feature', data);
  }

  @override
  Future<Either<ServerFailure, List<String>?>> getFeature() async {
    try {
      final response = await _commonLocalDatasources.getFeature();

      return right(response);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
