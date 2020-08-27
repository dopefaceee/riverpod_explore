import 'package:dio/dio.dart';
import 'package:riverpod_explore/src/models/chapter.dart';
import 'package:riverpod_explore/src/models/chapters.dart';
import 'package:riverpod_explore/src/network/api_request.dart';
import 'package:riverpod_explore/src/network/endpoints.dart';

class ApiManager {
  static Future<Chapters> getAllChapters() async {
    Response response = await ApiRequest.get(Endpoints.getAllChapter());
    print('${response.data.toString()}');
    return Chapters.fromJson(response.data);
  }

  static Future<Chapter> getChapter({int chapter}) async {
    Response response = await ApiRequest.get(Endpoints.getChapter(chapter));
    return Chapter.fromJson(response.data);
  }
}
