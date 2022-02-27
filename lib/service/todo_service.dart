import 'package:api_placeholder/core/constants/url_const.dart';
import 'package:api_placeholder/models/todo_model.dart';
import 'package:dio/dio.dart';

class ToDoService {
  static Future<List<ToDoModel>> getPosts() async {
    Response res = await Dio().get(UrlConst.baseUrl + "/todos");
    return (res.data as List).map((e) => ToDoModel.fromJson(e)).toList();
  }
}
