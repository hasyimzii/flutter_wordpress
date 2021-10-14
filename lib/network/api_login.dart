import 'package:http/http.dart';

import '../config/constant.dart';
import '../model/login_model.dart';

class ApiLogin {
  static Future<LoginModel> login({
    required String username,
    required String password,
  }) async {
    Uri uri = Uri.https(Constant.baseUrl, '/jwt-auth/v1/token');
    Response _response = await post(
      uri,
      body: <String, dynamic>{
        'username': username,
        'password': password,
      },
    );
    return LoginModel.fromJson(_response.body);
  }
}
