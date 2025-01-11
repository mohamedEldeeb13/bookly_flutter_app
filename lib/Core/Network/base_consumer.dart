import 'package:bookly_flutter_app/Core/Model/custom_response.dart';

abstract interface class BaseConsumer {
  Future<CustomResponse<T>> getData<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<CustomResponse<T>> postData<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<CustomResponse<T>> putData<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<CustomResponse<T>> deleteData<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  });
}
