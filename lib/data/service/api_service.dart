import 'package:dio/dio.dart';

abstract class ApiService {
  Future<dynamic> invokeHttp(
    dynamic url,
    RequestType type, {
    Map<String, String>? headers,
    dynamic body,
    Map<String, dynamic>? params,
  });
}

enum RequestType {
  get,
  post,
  put,
  patch,
  delete,
}

class ApiServiceImpl extends ApiService {
  late final Dio _dio;

  ApiServiceImpl(this._dio);

  @override
  Future<dynamic> invokeHttp(
    dynamic url,
    RequestType type, {
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    dynamic body,
  }) async {
    try {
      var response = await _invoke(
        url,
        type,
        headers: headers,
        body: body,
        params: params,
      );

      return response.data;
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> _invoke(
    dynamic url,
    RequestType type, {
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    dynamic body,
  }) async {
    Response response;

    try {
      switch (type) {
        case RequestType.get:
          response = await _dio.get(
            url,
            queryParameters: params,
          );
          break;
        case RequestType.post:
          response = await _dio.post(
            url,
            data: body,
            options: Options(headers: headers),
          );
          break;
        case RequestType.put:
          response = await _dio.put(
            url,
            data: body,
            options: Options(headers: headers),
          );
          break;
        case RequestType.patch:
          response = await _dio.patch(
            url,
            data: body,
            options: Options(headers: headers),
          );
          break;
        case RequestType.delete:
          response = await _dio.delete(url, options: Options(headers: headers));
          break;
      }

      return response;
    } catch (error) {
      rethrow;
    }
  }
}
