import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:flutter_wordpress/model/search_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import '../provider/post_provider.dart';

class SearchCardPost extends StatelessWidget {
  final SearchModel searchModel;

  const SearchCardPost({Key? key, required this.searchModel}) : super(key: key);

  _urlLaunchUrl() async {
    var url = searchModel.url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(
      builder: (context, provider, child) {
        return FutureBuilder(
          builder: (context, snapshot) {
            return Material(
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 8,
                    ),
                    leading: Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      searchModel.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.keyboard_arrow_right),
                      onPressed: () => _urlLaunchUrl(),
                    ),
                  ),
                  const Divider(),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
