import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class DioClient {
  DioClient(this.dio) {
    _setupInterceptors();
  }

  final Dio dio;
  final Logger _logger = Logger();

  void _setupInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          _logger
            ..i('Request: ${options.method} ${options.uri}')
            ..d('Headers: ${options.headers}')
            ..d('QueryParams: ${options.queryParameters}');
          handler.next(options);
        },
        onResponse: (response, handler) {
          _logger.i('Response: ${response.statusCode} ${response.requestOptions.uri}');
          handler.next(response);
        },
        onError: (DioException exception, handler) {
          _logger.e('Error: ${exception.message} - ${exception.response?.statusCode}');
          handler.next(exception);
        },
      ),
    );
  }

  Dio get client => dio;
}
