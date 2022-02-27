import 'package:api_placeholder/core/constants/url_const.dart';
import 'package:api_placeholder/models/user_model.dart';
import 'package:dio/dio.dart';

class UserService {
  static Future<List<UserModel>> getPosts() async {
    Response res = await Dio().get(UrlConst.baseUrl + "/users");
    return (res.data as List).map((e) => UserModel.fromJson(e)).toList();
  }
}
