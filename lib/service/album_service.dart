import 'package:api_placeholder/core/constants/url_const.dart';
import 'package:api_placeholder/models/album_model.dart';
import 'package:dio/dio.dart';

class AlbumService {
  static Future<List<AlbumModel>> getPosts() async {
    Response res = await Dio().get(UrlConst.baseUrl + "/albums");
    return (res.data as List).map((e) => AlbumModel.fromJson(e)).toList();
  }
}
