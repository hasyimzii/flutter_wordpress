import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'network/api_login.dart';
import 'network/api_post.dart';
import 'network/api_search.dart';
import 'provider/login_provider.dart';
import 'provider/post_provider.dart';
import 'provider/search_provider.dart';
import 'view/splash_screen.dart';
import 'view/blog_list.dart';
import 'view/login_page.dart';
import 'view/blog_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => PostProvider(
            apiPost: ApiPost(),
          ),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => LoginProvider(
            apiLogin: ApiLogin(),
          ),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => SearchProvider(
            apiSearch: ApiSearch(),
          ),
        ),
      ],
      builder: (
        BuildContext context,
        Widget? child,
      ) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.dark,
          ),
          initialRoute: '/splash_screen',
          routes: {
            '/splash_screen': (context) => const SplashScreen(),
            '/blog_list': (context) => const BlogList(),
            '/login_page': (context) => const LoginPage(),
            '/blog_search': (context) => const BlogSearch(),            
          },
        );
      },
    );
  }
}
