import 'package:flutter/material.dart';

class ScaffoldTheme extends StatelessWidget {
  final String title;
  final Widget body;

  const ScaffoldTheme({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Center(
          child: body,
        ),
      ),
    );
  }
}
