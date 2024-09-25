import 'package:dio/dio.dart';

class ApiService {
  final String baseUrl = "https://www.googleapis.com/books/v1/";
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoints}) async {
    var response = await _dio.get("$baseUrl$endPoints");
    return response.data;
  }
}
