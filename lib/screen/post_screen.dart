// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


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
