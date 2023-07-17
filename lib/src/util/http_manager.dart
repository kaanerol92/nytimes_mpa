import 'package:dio/dio.dart';

import 'environment.dart';

class HttpManager {
  static final HttpManager httpManager = HttpManager();
  static HttpManager get instance => httpManager;

  static int success = 200;
  static int unauthorized = 401;
  static int tooManyRequest = 429;

  Dio dio = Dio();

  HttpManager() {
    configureDio();
  }

  configureDio() {
    dio.options.baseUrl = Environment.baseUrl;
    // dio.interceptors.add(DioInterceptor());
  }

  Future get(String endpoint, {Map<String, dynamic>? params}) async {
    var result = await dio.get(endpoint,queryParameters: params);
    if(success == result.statusCode) {
      return result.data;
    } else if (unauthorized == result.statusCode) {
      throw Exception("Unauthorized Request!");
    } else if (tooManyRequest == result.statusCode) {
      throw Exception("Too Many Requests!");
    }
  }
}
