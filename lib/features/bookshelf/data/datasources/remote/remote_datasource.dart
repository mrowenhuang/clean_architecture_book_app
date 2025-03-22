import 'package:book_app/core/constant/api_network.dart';
import 'package:book_app/core/failure/server_failure.dart';
import 'package:dio/dio.dart';

abstract class RemoteDatasource {
  Future<List> getTrendingBook();
}

final class RemoteDatasourceImpl extends RemoteDatasource {
  final Dio _dio = Dio();

  @override
  Future<List> getTrendingBook() async {
    final response = await _dio.get(ApiNetwork.trendingBook);

    if (response.statusCode == 200) {
      return response.data['works'] as List;
    } else {
      throw ServerFailure(message: "Something Wrong");
    }
  }
}
