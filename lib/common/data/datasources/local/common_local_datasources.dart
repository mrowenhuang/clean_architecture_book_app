import 'package:hive_flutter/hive_flutter.dart';

abstract class CommonLocalDatasources {
  Future<List<String>?> getFeature();
}

class CommonLocalDatasourcesImpl implements CommonLocalDatasources {
  @override
  Future<List<String>?> getFeature() async {
    final Box box = await Hive.openBox('feature');

    if ((box.get('feature')) != null) {
      final response = await box.get('feature');
      return response as List<String>;
    } else if ((box.get('feature')) == null) {
      return null;
    } else {
      throw ('Something was Wrong');
    }
  }
}
