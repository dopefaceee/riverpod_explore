import 'package:dio/dio.dart';

Map<String, dynamic> optHeader = {
  'accept-language': 'en-US',
  'content-type': 'application/json'
};

var dio = Dio(BaseOptions(connectTimeout: 30000, headers: optHeader));

class ApiRequest {
  static Future get(String url, [Map<String, dynamic> params]) async {
    Response response;
    if (params != null) {
      response = await dio.get(url, queryParameters: params);
    } else {
      response = await dio.get(url);
    }
    return response;
  }

  static Future post(String url, Map<String, dynamic> params) async {
    var response = await dio.post(url, data: params);
    return response;
  }
}
