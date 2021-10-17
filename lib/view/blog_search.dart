import 'package:flutter/material.dart';
import 'package:flutter_wordpress/model/search_model.dart';
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
        title: const Text("Seacrh"),
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
                      TextFormField(
                        controller: _searchController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Searching',
                          suffixStyle: TextStyle(color: Colors.grey),
                          suffixIcon: IconButton(
                            onPressed: () {
                              provider.setName(_searchController.text);
                            },
                            icon: Icon(
                              Icons.search,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: _buildList(provider),
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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  _buildList(SearchProvider provider) {
    if (provider.state == ResultState.Loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (provider.state == ResultState.HasData) {
      return _searchController.text.isEmpty
          ? Center(
              child: Text("Cari Blog anda..."),
            )
          : _postCard(provider.postResult);
    } else if (provider.state == ResultState.NoData) {
      return Center(
        child: Text(provider.message),
      );
    } else if (provider.state == ResultState.Error) {
      return Center(
        child: Text(provider.message),
      );
    } else {
      return Center(
        child: Text(""),
      );
    }
  }

  Widget _postCard(List<SearchModel> postResult) {
    return Column(
        children: postResult
            .map(
              (e) => Padding(
                padding: EdgeInsets.only(top: 8),
                child: Container(
                  width: double.infinity,
                  child: SearchCardPost(searchModel: e),
                ),
              ),
            )
            .toList());
  }
}
