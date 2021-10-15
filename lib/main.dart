import 'package:flutter/material.dart';
import 'package:flutter_wordpress/provider/post_provider.dart';
import 'package:provider/provider.dart';

import 'network/api_post.dart';
import 'view/splash_screen.dart';
import 'view/blog_list.dart';
import 'view/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PostProvider(
        apiPost: ApiPost(),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        initialRoute: '/splash_screen',
        routes: {
          '/splash_screen': (context) => const SplashScreen(),
          '/blog_list': (context) => const BlogList(),
          '/login_page': (context) => const LoginPage(),
        },
      ),
    );
  }
}
