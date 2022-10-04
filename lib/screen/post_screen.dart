import 'package:flutter/material.dart';

import '../modal/posts.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final a = Posts.title;
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('''''' '''''' ''),
            subtitle: Text('Body'),
          );
        },
        itemCount: 2,
      ),
    );
  }
}
