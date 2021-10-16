import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

import '../model/post_model.dart';
import '../provider/post_provider.dart';

class CardPost extends StatelessWidget {
  final PostModel postModel;

  const CardPost({Key? key, required this.postModel}) : super(key: key);

  _urlLaunchUrl() async {
    var url = postModel.link;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(builder: (context, provider, child) {
      return FutureBuilder(builder: (context, snapshot) {
        return Material(
            child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 8,
              ),
              leading: Image.asset("assets/images/logo.png"),
              title: Text(
                postModel.title.rendered,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: SizedBox(
                height: 65,
                child: Html(
                  data: postModel.excerpt.rendered,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.keyboard_arrow_right),
                onPressed: () => _urlLaunchUrl(),
              ),
            ),
            const Divider(),
          ],
        ));
      });
    });
  }
}
