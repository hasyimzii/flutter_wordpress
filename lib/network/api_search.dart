import 'package:http/http.dart';
import 'dart:convert';
import '../config/constant.dart';
import '../model/search_model.dart';

class ApiSearch {
  static final List<SearchModel> listPost = [];

  Future<List<SearchModel>> search(String name) async {
    // Uri uri = Uri.https(Constant.baseUrl, '/jwt-auth/v1/token');
    Response _response = await get(
      Uri.parse(Constant.baseUrl + '/wp/v2/search?search=$name'),
    );
    if (_response.statusCode == 200) {
      final data = json.decode(_response.body);
      for (Map<String, dynamic> i in data) {
        listPost.add(SearchModel.fromJson(i));
      }
      return listPost;
    } else {
      throw Exception("Failed to login!");
    }
  }
}
