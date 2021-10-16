import 'package:flutter/foundation.dart';

import '../config/constant.dart';
import '../model/login_model.dart';
import '../network/api_login.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider({required this.apiLogin});

  final ApiLogin? apiLogin;
  final constant = Constant();

  Future<void> getLogin(String username, String password) async {
    LoginModel loginResult = await apiLogin!.login(
      username: username,
      password: password,
    );
    constant.setToken(loginResult.token);
    notifyListeners();
  }

  bool getToken() {
    if(constant.token != '') {
      return true;
    }
    else {
      return false;
    }
  }

  void logout() {
    constant.setToken('');
    notifyListeners();
  }
}