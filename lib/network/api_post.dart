import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config/constant.dart';
import '../model/post_model.dart';

class ApiPost {
  static final List<PostModel> listPost = [];

  Future<List<PostModel>> getAllPost() async {
    final response =
        await http.get(Uri.parse(Constant.baseUrl + "/wp/v2/posts"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      for (Map<String, dynamic> i in data) {
        listPost.add(PostModel.fromJson(i));
      }
      return listPost;
    } else {
      throw Exception("Failed to load Post");
    }
  }
}
