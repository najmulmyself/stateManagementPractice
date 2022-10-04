import 'dart:convert';

import 'package:api_practice/modal/posts.dart';
import 'package:api_practice/screen/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  final List postData = [];

  Future getData() async {
    final resonse =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    // print('resonse.body');
    final data = jsonDecode(resonse.body);
    // print(data[0]);
    Posts a = Posts.fromJson(data as Map<String, dynamic>);
    // return Posts.fromJson(data[0]);
    print("hello 1 :${a.title}");
    print("hello 2 :${a.body}");

    // print(a.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('${getData()}'),
            ElevatedButton(
                child: Text('Get Data'),
                onPressed: () {
                  getData();
                  Get.to(PostPage(), transition: Transition.cupertino);
                }),
          ],
        ),
      ),
    );
  }
}
