import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:flutter_wordpress/model/post_model.dart';
import 'package:flutter_wordpress/provider/post_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CardPost extends StatelessWidget {
  final PostModel postModel;

  CardPost({required this.postModel});

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
              contentPadding: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 8,
              ),
              leading: Image.asset("assets/images/logo.png"),
              title: Text(
                postModel.title.rendered,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Container(
                height: 65,
                child: Html(
                  data: "${postModel.excerpt.rendered}",
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.keyboard_arrow_right),
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
