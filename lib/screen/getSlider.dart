import 'package:api_practice/controller/getSlider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetSlider extends StatelessWidget {
  final getSlider sliderController = getSlider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GetSlider"),
        ),
        body: Obx((() => Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.red.withOpacity(sliderController.opacity.value),
                ),
                Slider(
                    value: sliderController.opacity.value,
                    onChanged: (value) {
                      print(value);
                      sliderController.setOpacity(value);
                    })
              ],
            ))));
  }
}
