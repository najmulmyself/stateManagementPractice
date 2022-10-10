import 'dart:convert';

import 'package:api_practice/apiService/api_service.dart';
import 'package:api_practice/modal/posts.dart';
import 'package:api_practice/screen/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dynamic testdata = ApiService().getData();
    // print('heres testdata: $testdata');
    // print('heres testdata print: ${testdata.toString()}');
    // print(runtimeType.testdata);
    // print(testdata.title);
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

      body: ApiService().postData.length != 0
          ? ListView.builder(
              itemBuilder: (context, index) {
                print(ApiService().postData.length);
                return ListTile(
                  title: Text('${ApiService().postData[index].title}'),
                  leading: CircleAvatar(),
                );
              },
              itemCount: ApiService().postData.length,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
