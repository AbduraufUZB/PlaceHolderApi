import 'package:api_placeholder/core/constants/url_const.dart';
import 'package:api_placeholder/models/photo_model.dart';
import 'package:dio/dio.dart';

class PhotoService{
  static Future<List<PhotoModel>> getPosts() async {
    Response res = await Dio().get(UrlConst.baseUrl + "/photos");
    return (res.data as List).map((e) => PhotoModel.fromJson(e)).toList();
  }
}