import 'package:book_app/common/domain/repositories/common_repositories.dart';

class FeatureGet {
  final CommonRepositories _commonRepositories;

  FeatureGet(this._commonRepositories);

  Future<List<Map<String, dynamic>>> call() async {
    return await _commonRepositories.getFeature();
  }
}
