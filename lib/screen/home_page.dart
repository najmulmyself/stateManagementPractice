import 'dart:convert';

import 'package:api_practice/modal/posts.dart';
import 'package:api_practice/screen/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dynamic testdata = getData();
    // print('heres testdata: $testdata');
    // print('heres testdata print: ${testdata.toString()}');
    // print(runtimeType.testdata);
    // print(testdata.title);
  }

  final List postData = [];

  Future getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    // print('${response.body}');
    final data = jsonDecode(response.body);
    // print(data);
    // print(data[0]['title']);
    Posts a = Posts.fromJson(data[0]);
    // return Posts.fromJson(data[0]);
    // print("hello 1 :${a.title}");
    // print("hello 2 :${a.body}");

    // print(a.body);

    return a;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      // body: Center(
      //   child: Column(
      //     children: [
      //       Text('{getData()}'),
      //       ElevatedButton(
      //           child: Text('Get Data'),
      //           onPressed: () {
      //             getData();
      //             Get.to(PostPage(), transition: Transition.cupertino);
      //           }),
      //     ],
      //   ),
      // ),
      body: FutureBuilder(
          builder: (context, AsyncSnapshot snapshot) {
            return snapshot.hasData ? Column(
              children: [
                Text('${snapshot.data.title}'),
                // ElevatedButton(
                //     child: Text('Get Data'),
                //     onPressed: () {
                //       getData();
                //       Get.to(PostPage(), transition: Transition.cupertino);
                //     }),
              ],
            ): Center(child: CircularProgressIndicator(),);
          },
          future: getData()),
    );
  }
}
