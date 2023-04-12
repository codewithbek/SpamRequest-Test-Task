import 'dart:io';
import 'package:spam_request/export_files.dart';
import 'package:dio/dio.dart' as dio;

class DioClient {
// dio instance
  final dio.Dio _dio = dio.Dio();

  DioClient() {
    _dio
      ..options.baseUrl = ApiService.baseUrl
      ..options.responseType = dio.ResponseType.json;
  }

  Future<dio.Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    dio.Options? options,
    dio.CancelToken? cancelToken,
    dio.ProgressCallback? onSendProgress,
    dio.ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final dio.Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } on dio.DioError catch (e) {
      DioExceptions.fromDioError(e);
      if (e.error is SocketException || e.type == DioErrorType.unknown) {
        await Future.delayed(
          const Duration(seconds: 5),
        );
        return await post(
          url,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        );
      }
      return e.response!;
    } catch (e) {
      rethrow;
    }
  }
}
