import 'package:book_app/common/domain/repositories/common_repositories.dart';

class FeatureSave {
  final CommonRepositories _commonRepositories;

  FeatureSave(this._commonRepositories);

  void call(List<Map<String, dynamic>> data) async {
    _commonRepositories.saveFeature(data);
  }
}
