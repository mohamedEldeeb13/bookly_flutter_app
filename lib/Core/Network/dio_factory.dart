import 'package:bookly_flutter_app/Core/Utils/local_storage_manager.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// Private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;
  static const Duration _defaultTimeout = Duration(seconds: 5);

  static getDio() async {
    if (dio == null) {
      dio = _createDio(_defaultTimeout);
      await _addDioHeaders();
      _addDioInterceptor();
    }
    return dio!;
  }

  static Dio _createDio(Duration timeout) {
    final dio = Dio()
      ..options.connectTimeout = timeout
      ..options.receiveTimeout = timeout
      ..options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );

    return dio;
  }

  static _addDioHeaders() async {
    final token = await LocalStorageManager().getAccessToken();
    if (token != null) {
      dio?.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers['Authorization'] = 'Bearer $token';
  }

  static void _addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
