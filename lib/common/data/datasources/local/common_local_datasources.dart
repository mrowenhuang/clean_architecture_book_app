import 'package:hive_flutter/hive_flutter.dart';

abstract class CommonLocalDatasources {
  Future<List<Map<String, dynamic>>> getFeature();
}

class CommonLocalDatasourcesImpl implements CommonLocalDatasources {
  final Box _box;

  CommonLocalDatasourcesImpl(this._box);

  @override
  Future<List<Map<String, dynamic>>> getFeature() async {
    if ((_box.get('feature')) != null) {
      final response = await _box.get('feature');
      return response as List<Map<String,dynamic>>;
    } else {
      throw ("No Feature Saved");
    }
  }
}
