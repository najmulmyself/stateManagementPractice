import 'dart:convert';

import 'package:api_practice/modal/posts.dart';
import 'package:http/http.dart' as http;


class ApiService {
  final List<dynamic> postData = [];

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
  final List<dynamic> postData = [];

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
    return postData; // return a;
  }
}
