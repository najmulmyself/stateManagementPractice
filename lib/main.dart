// import 'package:api_practice/screen/home_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_navigation/get_navigation.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Material App',
//       home: HomePage(),
//     );
//   }
// }


import 'dart:async';  
import 'dart:convert';  
  
import 'package:api_practice/modal/posts.dart';
import 'package:flutter/material.dart';  
import 'package:http/http.dart' as http;  
  
void main() => runApp(MyApp());  
  
class MyApp extends StatefulWidget {  
  // MyApp({Key key}) : super(key: key);  
  
  @override  
  _MyAppState createState() => _MyAppState();  
}  
  
class _MyAppState extends State<MyApp> {  
Future<Posts> ? post;  
  
  @override  
  void initState() {  
    super.initState();  
    post = fetchPost();  
  }  
  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      title: 'Flutter REST API Example',  
      theme: ThemeData(  
        primarySwatch: Colors.green,  
      ),  
      home: Scaffold(  
        appBar: AppBar(  
          title: Text('Flutter REST API Example'),  
        ),  
        body: Center(  
          child: FutureBuilder<Posts>(  
            future: post,  
            builder: (context, abc) {  
              // if (abc.hasData) {  
              //   return Text(abc.data!.title!);  
              // } else if (abc.hasError) {  
              //   return Text("Error shown here : ${abc.error}");  
              // }  
                return Text(abc.data!.title!);  
  
              // By default, it show a loading spinner.  
              return CircularProgressIndicator();  
            },  
          ),  
        ),  
      ),  
    );  
  }  
}  
  
Future<Posts> fetchPost() async {  
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));  
  
  if (response.statusCode == 200) {  
    // If the call to the server was successful (returns OK), parse the JSON.  
    return Posts.fromJson(json.decode(response.body));  
  } else {  
    // If that call was not successful (response was unexpected), it throw an error.  
    throw Exception('Failed to load post');  
  }  
}  