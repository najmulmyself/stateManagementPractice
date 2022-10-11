// import 'dart:convert';

// import 'package:api_practice/apiService/api_service.dart';
// import 'package:api_practice/modal/posts.dart';
// import 'package:api_practice/screen/post_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     dynamic testdata = ApiService().getData();
//     // print('heres testdata: $testdata');
//     // print('heres testdata print: ${testdata.toString()}');
//     // print(runtimeType.testdata);
//     // print(testdata.title);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Material App Bar'),
//       ),
//       // body: Center(
//       //   child: Column(
//       //     children: [
//       //       Text('{getData()}'),
//       //       ElevatedButton(
//       //           child: Text('Get Data'),
//       //           onPressed: () {
//       //             getData();
//       //             Get.to(PostPage(), transition: Transition.cupertino);
//       //           }),
//       //     ],
//       //   ),
//       // ),
//       //////////////
//       ///
//       /// FETCHED DATA THROUGH FUTURE BUILDER
//       ////////////////////////
//       ///
//       // body: FutureBuilder(
//       //     builder: (context, AsyncSnapshot snapshot) {
//       //       return snapshot.hasData ? Column(
//       //         children: [
//       //           Text('${snapshot.data.title}'),
//       //           // ElevatedButton(
//       //           //     child: Text('Get Data'),
//       //           //     onPressed: () {
//       //           //       getData();
//       //           //       Get.to(PostPage(), transition: Transition.cupertino);
//       //           //     }),
//       //         ],
//       //       ): Center(child: CircularProgressIndicator(),);
//       //     },
//       //     future: getData()),

//       body: ApiService().postData.length != 0
//           ? ListView.builder(
//               itemBuilder: (context, index) {
//                 print(ApiService().postData.length);
//                 return ListTile(
//                   title: Text('${ApiService().postData[index].title}'),
//                   leading: CircleAvatar(),
//                 );
//               },
//               itemCount: ApiService().postData.length,
//             )
//           : Center(
//               child: CircularProgressIndicator(),
//             ),
//     );
//   }
// }






















// import 'package:api_demo/models/post.dart';
// import 'package:api_demo/services/remote_service.dart';
import 'package:api_practice/apiService/api_service.dart';
import 'package:api_practice/modal/posts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Posts>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Visibility(
        visible: isLoaded,
        // ignore: sort_child_properties_last
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[300],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          posts![index].title!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          posts![index].body ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
