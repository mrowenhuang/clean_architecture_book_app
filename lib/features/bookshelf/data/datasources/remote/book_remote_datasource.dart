import 'package:book_app/core/constant/api_network.dart';
import 'package:book_app/core/failure/server_failure.dart';
import 'package:dio/dio.dart';

abstract class BookRemoteDatasource {
  Future<List> getTrendingBook();
  Future<List> getLiteratureBook();
  Future<List> getTextBook();
  Future<List> getThrillersBook();
  Future<List> getRomanceBook();
  Future<List> getProgrammingBook();
  Future<Map<String, dynamic>> getQuotes();
  Future<List> searchBook(String value);
}

final class BookRemoteDatasourceImpl implements BookRemoteDatasource {
  final Dio _dio = Dio();

  // 2 : feature area
  @override
  Future<List> getTrendingBook() async {
    final response = await _dio.get(ApiNetwork.trendingBook);

    if (response.statusCode == 200) {
      return response.data['works'];
    } else {
      throw ServerFailure(message: "Something Wrong");
    }
  }
  // 2 : subject area

  @override
  Future<List> getLiteratureBook() async {
    final response = await _dio.get(ApiNetwork.literatureBook);

    if (response.statusCode == 200) {
      return response.data['works'];
    } else {
      throw ServerFailure(message: "Something Wrong");
    }
  }

  @override
  Future<List> getProgrammingBook() async {
    final response = await _dio.get(ApiNetwork.programmingBook);

    if (response.statusCode == 200) {
      return response.data['works'];
    } else {
      throw ServerFailure(message: "Something Wrong");
    }
  }

  @override
  Future<List> getRomanceBook() async {
    final response = await _dio.get(ApiNetwork.romanceBook);

    if (response.statusCode == 200) {
      return response.data['docs'];
    } else {
      throw ServerFailure(message: "Something Wrong");
    }
  }

  @override
  Future<List> getTextBook() async {
    final response = await _dio.get(ApiNetwork.textBook);

    if (response.statusCode == 200) {
      return response.data['docs'];
    } else {
      throw ServerFailure(message: "Something Wrong");
    }
  }

  @override
  Future<List> getThrillersBook() async {
    final response = await _dio.get(ApiNetwork.thrillersBook);

    if (response.statusCode == 200) {
      return response.data['works'];
    } else {
      throw ServerFailure(message: "Something Wrong");
    }
  }

  @override
  Future<Map<String, dynamic>> getQuotes() async {
    final response = await _dio.get(ApiNetwork.quotes);

    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw ServerFailure(message: "Something Wrong");
    }
  }

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
