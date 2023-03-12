import 'package:api_practice/controller/favouriteController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetFav extends StatelessWidget {
  final fruitList = ['orange', 'mango', 'apple', 'banana'];
  final tempFruit = [];
  FavouriteController controller = FavouriteController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite App'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                if (controller.tempFruit
                    .contains(controller.fruitList[index].toString())) {
                  controller.tempFruit.remove(controller.fruitList[index]);
                } else {
                  controller.tempFruit.add(controller.fruitList[index]);
                }
              },
              title: Text(
                controller.fruitList[index].toString(),
              ),
              trailing: Obx(
                () => Icon(
                  Icons.favorite,
                  color: controller.tempFruit
                          .contains(controller.fruitList[index].toString())
                      ? Colors.red
                      : Colors.grey,
                ),
              ),
            ),
          );
        },
        itemCount: controller.fruitList.length,
      ),
    );
  }
}
