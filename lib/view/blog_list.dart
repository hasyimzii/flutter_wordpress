import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/post_provider.dart';
import '../provider/login_provider.dart';
import '../utils/result_state.dart';
import '../widget/card_post.dart';

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: const Icon(Icons.search),
              onTap: () {
                Navigator.pushNamed(context, '/blog_search');
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Consumer<LoginProvider>(
        builder: (
          BuildContext context,
          LoginProvider login,
          Widget? child,
        ) {
          bool logged = login.getToken();
          return FloatingActionButton.extended(
            icon: (logged) ? const Icon(Icons.logout) : const Icon(Icons.login),
            label: (logged) ? const Text('Logout') : const Text('Login'),
            onPressed: () {
              // if logged remove token
              (logged)
                  ? login.logout()
                  : Navigator.pushNamed(context, '/login_page');
            },
          );
        },
      ),
      body: Consumer<PostProvider>(
        builder: (context, provider, child) {
          if (provider.state == ResultState.Loading) {
            return const Center(
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
