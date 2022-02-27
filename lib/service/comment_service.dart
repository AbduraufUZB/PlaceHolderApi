import 'package:api_placeholder/core/constants/url_const.dart';
import 'package:api_placeholder/models/comment_model.dart';
import 'package:dio/dio.dart';

class CommentService {
  static Future<List<CommentModel>> getPosts() async {
    Response res = await Dio().get(UrlConst.baseUrl + "/comments");
    return (res.data as List).map((e) => CommentModel.fromJson(e)).toList();
  }
}
