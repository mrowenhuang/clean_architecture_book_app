import 'package:book_app/common/domain/repositories/common_repositories.dart';

class FeatureSave {
  final CommonRepositories _commonRepositories;

  FeatureSave(this._commonRepositories);

  void call(List<String> data) async {
    _commonRepositories.saveFeature(data);
  }
}
