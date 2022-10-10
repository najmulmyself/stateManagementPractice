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

  late List<dynamic> postData = [];

  Future getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    // print('${response.body}');
    final data = jsonDecode(response.body);
    // print(data[0]['title']);
    // Posts a = Posts.fromJson(data.toList());
    // return Posts.fromJson(data[0]);
    // print("hello 1 :${a.title}");
    // print("hello 2 :${a.body}");

    // print(a.body);
    // a.map((e) => postData.add(a.id));
    data
        .map(
          (e) => postData.add(
            Posts.fromJson(e),
          ),
        )
        .toList();
    print(postData.length);
    print(postData[0].title);
    // print('heres testdata: ${postData[0]}');
    // return postData; // return a;
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
      //////////////
      ///
      /// FETCHED DATA THROUGH FUTURE BUILDER
      ////////////////////////
      ///
      // body: FutureBuilder(
      //     builder: (context, AsyncSnapshot snapshot) {
      //       return snapshot.hasData ? Column(
      //         children: [
      //           Text('${snapshot.data.title}'),
      //           // ElevatedButton(
      //           //     child: Text('Get Data'),
      //           //     onPressed: () {
      //           //       getData();
      //           //       Get.to(PostPage(), transition: Transition.cupertino);
      //           //     }),
      //         ],
      //       ): Center(child: CircularProgressIndicator(),);
      //     },
      //     future: getData()),

      body: postData.length == 0
          ? ListView.builder(
              itemBuilder: (context, index) {
                print(postData.length);
                return ListTile(
                  title: Text('falsdfj'),
                  leading: CircleAvatar(),
                );
              },
              itemCount: 2,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
