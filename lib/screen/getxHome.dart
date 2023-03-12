import 'dart:developer';

import 'package:api_practice/controller/getController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetHome extends StatelessWidget {
  final getController controller = getController();
  // both way we can use instance of a class in getX;
  // final getContoller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX Counter"),
      ),
      body: Center(
        child: Obx(() => Text(
              controller.count.toString(),
              style: const TextStyle(
                fontSize: 30,
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.increment();
      }),
    );
  }
}
