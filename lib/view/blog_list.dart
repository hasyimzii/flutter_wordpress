import 'package:flutter/material.dart';
import 'package:flutter_wordpress/model/post_model.dart';
import 'package:flutter_wordpress/provider/post_provider.dart';
import 'package:flutter_wordpress/utils/result_state.dart';
import 'package:flutter_wordpress/widget/card_post.dart';
import 'package:provider/provider.dart';

import '../widget/scaffold_theme.dart';

class BlogList extends StatefulWidget {
  const BlogList({Key? key}) : super(key: key);

  @override
  State<BlogList> createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Blog Gits"),
      ),
      body: Consumer<PostProvider>(
        builder: (context, provider, child) {
          if (provider.state == ResultState.Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.state == ResultState.HasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: provider.postResult.length,
              itemBuilder: (context, index) {
                var post = provider.postResult[index];
                return CardPost(postModel: post);
              },
            );
          } else if (provider.state == ResultState.NoData) {
            return Center(
              child: Text(provider.message),
            );
          } else if (provider.state == ResultState.Error) {
            return Center(
              child: Text(provider.message),
            );
          } else {
            return const Center(child: Text(''));
          }
        },
      ),
    );
  }
}
