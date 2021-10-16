import 'package:flutter/cupertino.dart';
import '../model/search_model.dart';
import '../network/api_search.dart';
import '../utils/result_state.dart';

class SearchProvider extends ChangeNotifier {
  final ApiSearch? apiSearch;

  SearchProvider({required this.apiSearch}) {
    _fetchAllPost();
  }

  List<SearchModel>? _searchModel;
  String _message = "";
  ResultState? _state;

  String get message => _message;
  List<SearchModel> get postResult => _searchModel!;
  ResultState get state => _state!;

  Future<dynamic> _fetchAllPost() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final post = await apiSearch!.search();
      if (post.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = "Data is empty";
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _searchModel = post;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = "Error to get data from API";
    }
  }
}
