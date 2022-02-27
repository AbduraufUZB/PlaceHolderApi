import 'package:api_placeholder/core/constants/url_const.dart';
import 'package:api_placeholder/models/post_model.dart';
import 'package:dio/dio.dart';

class PostService {
  static Future<List<PostModel>> getPosts() async {
    Response res = await Dio().get(UrlConst.baseUrl + "/posts");
    return (res.data as List).map((e) => PostModel.fromJson(e)).toList();
  }
}
