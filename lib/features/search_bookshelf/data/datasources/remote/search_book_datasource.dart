import 'package:book_app/core/constant/api_network.dart';
import 'package:book_app/core/failure/server_failure.dart';
import 'package:dio/dio.dart';

abstract class SearchBookDatasource {
  Future<List> searchBook(String value);
}

class SearchBookDatasourceImpl implements SearchBookDatasource {
  final Dio _dio = Dio();

  @override
  Future<List> searchBook(String value) async {
    final response = await _dio.get(ApiNetwork.searchBook(value));

    if (response.statusCode == 200) {
      return response.data['items'];
    } else {
      throw ServerFailure(message: "Something Wrong");
    }
  }
}
