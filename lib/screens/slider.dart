import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/slider_controller.dart';
import '../Controller/switch_controller.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  final slider_controller controller = Get.put(slider_controller());
  final SwitchController switchController = Get.put(SwitchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider Screen"),
        //centerTitle: true,
       // backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          children: [
            Obx(() => Container(
                  color: Colors.red.withOpacity(controller.val.value),
                  height: 200,
                  width: 200,
                )),
            Obx(() => Slider(
                value: controller.val.value,
                onChanged: (value) {
                  controller.setValue(value);
                })),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Settings", style: TextStyle(fontSize: 20)),
                  Obx(
                    () => Switch(
                        value: switchController.isOn.value,
                        onChanged: (val) {
                          switchController.changeValue(val);
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
