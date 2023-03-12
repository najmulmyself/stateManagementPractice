import 'package:get/get.dart';

class FavouriteController extends GetxController {
  final fruitList = ['orange', 'mango', 'apple', 'banana'].obs;
  final tempFruit = [].obs;

  addToFav(String value) {
    tempFruit.add(value);
  }

  removeFromFav(String value) {
    tempFruit.remove(value);
  }
}
