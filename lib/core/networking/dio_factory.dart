import 'package:dio/dio.dart';

class DioFactory{
  const DioFactory._();

  static Dio? _dio;

  static Dio getDio() {
    if (_dio == null) {
      Duration timeout = const Duration(seconds: 30);
      _dio = Dio(
        BaseOptions(
          baseUrl: "https://api.coingecko.com/api/v3/",
          connectTimeout: timeout,
          receiveTimeout: timeout,
          sendTimeout: timeout,
        ),
      );
    }
    return _dio!;
  }
}