import 'package:dio/dio.dart';
import 'package:pokedex/core/services/services.dart';

class DioClient {
  final Dio _dio;

  DioClient({required Dio dio}) : _dio = dio {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) {
          log.w("(DioClient) Response data: ${response.data}");
          return handler.next(response);
        },
        onError: (error, handler) {
          log.e("(DioClient) Error: ${error.response?.data}");
          return handler.next(error);
        },
      ),
    );
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.get(url, queryParameters: queryParameters);
    } catch (e) {
      rethrow;
    }
  }
}
