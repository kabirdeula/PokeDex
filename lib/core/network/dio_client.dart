import 'package:dio/dio.dart';
import 'package:pokedex/core/dependency_injection/dependency_injection.dart';
import 'package:pokedex/core/services/services.dart';

/// A wrapper around [Dio] to handle HTTP requests and common configurations.
/// This class provides a clean and reusable way to make network calls.
class DioClient {
  final Dio _dio;

  /// Constructs an instance of [DioClient] with a pre-configured [Dio] instance.
  /// Adds interceptors for logging and error handling.
  DioClient({required Dio dio}) : _dio = dio {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          log.e("(DioClient) Error: ${error.response?.data}");
          return handler.next(error);
        },
      ),
    );
  }

  /// Sends a GET request to the given [url] with optional [queryParameters].
  ///
  /// Returns the response from the server as a [Response].
  /// Throws any exceptions encountered during the request.
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

/// A globally accessible instance of [DioClient].
/// Uses the [serviceLocator] to retrieve the [Dio] instance.
final dioClient = DioClient(dio: serviceLocator<Dio>());
