class Constant {
  static const String baseUrl = 'https://gits-msib.my.id/wp-json';
  static String _loginToken = '';

  String get token => _loginToken;
  void setToken(token) {
    _loginToken = token;
  }
}