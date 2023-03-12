import 'package:get/get.dart';

class getController extends GetxController {
  final count = 0.obs;

  increment() {
    count.value++;
    print(count.value);
  }
}
