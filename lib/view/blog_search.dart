import 'package:flutter/material.dart';
import 'package:flutter_wordpress/model/search_model.dart';
import 'package:flutter_wordpress/network/api_search.dart';
import 'package:flutter_wordpress/provider/search_provider.dart';
import 'package:flutter_wordpress/utils/result_state.dart';
import 'package:flutter_wordpress/widget/card_post.dart';
import 'package:flutter_wordpress/widget/card_post_search.dart';
import 'package:provider/provider.dart';

class BlogSearch extends StatefulWidget {
  const BlogSearch({Key? key}) : super(key: key);

  @override
  _BlogSearchState createState() => _BlogSearchState();
}

class _BlogSearchState extends State<BlogSearch> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(30.0),
              child: Form(
                child: Consumer<SearchProvider>(
                    builder: (context, provider, child) {
                  return Column(
                    children: [
                      TextField(
                        controller: _searchController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Searching',
                          suffixStyle: const TextStyle(color: Colors.grey),
                          suffixIcon: IconButton(
                            onPressed: () {
                              provider.setName(_searchController.text);
                            },
                            icon: const Icon(
                              Icons.search,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: _buildList(),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    return Consumer<SearchProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state.state == ResultState.HasData) {
          return _searchController.text.isEmpty
              ? const Center(
                  child: Text("Cari Blog anda..."),
                )
              : _postCard(state.postResult);
        } else if (state.state == ResultState.NoData) {
          return Center(
            child: Text(state.message),
          );
        } else if (state.state == ResultState.Error) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: Text(""),
          );
        }
      },
    );
  }

  Widget _postCard(List<SearchModel> postResult) {
    return Column(
        children: postResult
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  width: double.infinity,
                  child: SearchCardPost(searchModel: e),
                ),
              ),
            )
            .toList());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
