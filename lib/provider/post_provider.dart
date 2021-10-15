import 'package:flutter/cupertino.dart';
import 'package:flutter_wordpress/model/post_model.dart';
import 'package:flutter_wordpress/network/api_post.dart';
import 'package:flutter_wordpress/utils/result_state.dart';

class PostProvider extends ChangeNotifier {
  final ApiPost? apiPost;

  PostProvider({required this.apiPost}) {
    _fetchAllPost();
  }

  List<PostModel>? _postModel;
  String _message = "";
  ResultState? _state;

  String get message => _message;
  List<PostModel> get postResult => _postModel!;
  ResultState get state => _state!;

  Future<dynamic> _fetchAllPost() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final post = await apiPost!.getAllPost();
      if (post.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = "Data is empty";
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _postModel = post;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = "Error to get data from API";
    }
  }
}
