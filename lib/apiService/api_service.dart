import 'dart:convert';

import 'package:api_practice/modal/posts.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Posts>?> getData() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    // print('${response.body}');
    var data = jsonDecode(response.body);
    // print(data[0]['title']);
    // Posts a = Posts.fromJson(data.toList());
    // return Posts.fromJson(data[0]);
    // print("hello 1 :${a.title}");
    // print("hello 2 :${a.body}");

    // print(a.body);
    // a.map((e) => postData.add(a.id));
    // final List<dynamic> postData = [];

    // data
    //     .map(
    //       (e) => postData.add(
    //         Posts.fromJson(e),
    //       ),
    //     )
    //     .toList();
    // print(postData.length);
    // print(postData[0].title);
    // print('heres testdata: ${postData[0]}');
    print(data.runtimeType);
    data.forEach((element) {
      postsFromJson(element);
    });
    // return Posts.fromJson(data);
    // return postData; // return a;
  }
}
















// import 'package:api_demo/models/posts.dart';

// import 'package:api_practice/modal/posts.dart';
// import 'package:http/http.dart' as http;

// class RemoteService {
//   Future<List<Posts>?> getPosts() async {
//     var client = http.Client();

//     var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
//     var response = await client.get(uri);
//     if (response.statusCode == 200) {
//       var json = response.body;
//       // return postsFromJson(json);
//       return postsFromJson(json);
//     }
//   }
// }
