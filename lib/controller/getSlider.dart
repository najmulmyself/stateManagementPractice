import 'package:get/get.dart';

class getSlider extends GetxController {
  final opacity = 0.4.obs;

  setOpacity(double value) {
    opacity.value = value;
  }
}
