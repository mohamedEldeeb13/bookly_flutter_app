import 'package:bookly_flutter_app/Core/Model/custom_response.dart';
import 'package:dio/dio.dart';
import 'base_consumer.dart';

class DioConsumer implements BaseConsumer {
  const DioConsumer(this.dio);
  final Dio dio;

  @override
  Future<CustomResponse<T>> getData<T>(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get<T>(
        path,
        queryParameters: queryParameters,
      );
      return CustomResponse<T>(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CustomResponse<T>> postData<T>(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return CustomResponse<T>(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CustomResponse<T>> putData<T>(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return CustomResponse<T>(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CustomResponse<T>> deleteData<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return CustomResponse<T>(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } catch (e) {
      rethrow;
    }
  }
}
