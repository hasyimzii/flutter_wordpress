import 'package:flutter/material.dart';

import '../config/style.dart';
import '../widget/scaffold_theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScaffoldTheme(
      title: 'Login Page',
      body: Text(''),
    );
  }
}