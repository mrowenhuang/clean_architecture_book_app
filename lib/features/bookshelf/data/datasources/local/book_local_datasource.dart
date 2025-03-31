import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

abstract class BookLocalDatasource {
  Future<List> getBookmark();
}

class BookLocalDatasourceImpl implements BookLocalDatasource {
  final Box _box;

  BookLocalDatasourceImpl(this._box);

  @override
  Future<List> getBookmark() async {
    if ((_box.get('bookmark')) != null) {
      final response = await _box.get('bookmark');
      return response as List;
    } else {
      throw ("No Bookmark");
    }
  }
}
