import 'package:http/http.dart';

import '../config/constant.dart';
import '../model/login_model.dart';

class ApiLogin {
  Future<LoginModel> login({
    required String username,
    required String password,
  }) async {
    // Uri uri = Uri.https(Constant.baseUrl, '/jwt-auth/v1/token');
    Response _response = await post(
      Uri.parse(Constant.baseUrl + '/jwt-auth/v1/token'),
      body: <String, dynamic>{
        'username': username,
        'password': password,
      },
    );
    if(_response.statusCode == 200) {
      final LoginModel responseData = LoginModel.fromJson(_response.body);
      return responseData;
    }
    else {
      throw Exception("Failed to login!");
    }
  }
}
