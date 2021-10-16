import 'package:flutter/material.dart';

class BlogSearch extends StatefulWidget {
  const BlogSearch({Key? key}) : super(key: key);

  @override
  _BlogSearchState createState() => _BlogSearchState();
}

class _BlogSearchState extends State<BlogSearch> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Seacrh"),
        ),
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(30.0),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Searching',
                        suffixStyle: TextStyle(color: Colors.grey),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
