import 'package:book_app/common/domain/repositories/common_repositories.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CommonRepositoriesImpl implements CommonRepositories {
  final Box _box;
  final CommonRepositories _commonRepositories;

  CommonRepositoriesImpl(this._box, this._commonRepositories);

  @override
  void saveFeature(List<Map<String, dynamic>> data) {
    _box.put('feature', data);
  }

  @override
  Future<List<Map<String, dynamic>>> getFeature() async {
    final response = await _commonRepositories.getFeature();
    return response;
  }
}
