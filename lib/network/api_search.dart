import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config/constant.dart';
import '../model/search_model.dart';

class ApiSearch {
  static final List<SearchModel> listSearch = [];

  Future<List<SearchModel>> search(String name) async {
    // Uri uri = Uri.https(Constant.baseUrl, '/jwt-auth/v1/token');
    final _response = await http.get(
        Uri.parse(Constant.baseUrl + '/wp/v2/search?search=$name&per_page=5'));
    if (_response.statusCode == 200) {
      List<SearchModel> search = searchModelFromJson(_response.body).toList();
      return search;
    } else {
      throw Exception("Failed to get data!");
    }
  }
}
