import 'package:dio/dio.dart';

class ApiService {
  static late Dio dio;

  static const String _baseUrl = "https://student.valuxapps.com/api/";

// Initialize
  static dioInit() {
    dio = Dio(
      BaseOptions(
          baseUrl: _baseUrl,
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type': 'application/json',
          }),
    );
  }

  static Future<Response> postData({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    String? token,
    String lang = 'en',
  }) async {
    dio.options.headers = {'lang': lang, 'Authorization': token ?? ''};
    return await dio.post(
      endpoint,
      data: body,
      queryParameters: query,
    );
  }

  static Future<Response> getData({
    required url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
    String lang = 'ar',
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? ''
    };
    return await dio.get(
      url,
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response> putData({
    required url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
    String lang = 'ar',
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? ''
    };
    return await dio.put(
      url,
      data: data,
      queryParameters: query,
    );
  }
}
