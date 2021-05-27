import 'package:filmes_app/core/dio/interceptors/auth_interceptor.dart';
import 'package:filmes_app/core/dio/interceptors/time_execution_interceptor.dart';
import 'package:filmes_app/core/rest_client/rest_client.dart';
import 'package:filmes_app/core/rest_client/rest_client_exception.dart';
import 'package:filmes_app/core/rest_client/rest_client_response.dart';
import 'package:dio/dio.dart';

class RestClientDio implements RestClient {
  late Dio _dio;

  static final _baseOptions = BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
    connectTimeout: 60000,
    receiveTimeout: 60000,
  );

  RestClientDio() {
    _dio = Dio(_baseOptions);
    _dio.interceptors.addAll([
      TimeExecutionInterceptor(),
      AuthInterceptor(),
    ]);
  }

  @override
  RestClient auth() {
    _baseOptions.extra['auth_required'] = true;
    return this;
  }

  @override
  Future<RestClientResponse<T>> post<T>(
    String path, 
    { data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return RestClientResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioError catch (e) {
      throw RestClientException(
        message: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        error: e.error,
      );
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(
    String path, 
    { Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return RestClientResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioError catch (e) {
      throw RestClientException(
        message: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        error: e.error,
      );
    }
  }
}
