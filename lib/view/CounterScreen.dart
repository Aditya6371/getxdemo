import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/counter_controller.dart';

class Counterscreen extends StatefulWidget {
  final String title;
  const Counterscreen({
    super.key,
    required this.title,
  });

  @override
  State<Counterscreen> createState() => _CounterscreenState();
}

class _CounterscreenState extends State<Counterscreen> {
  final Counter_Controller controller = Get.put(Counter_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
           // style: TextStyle(color: colorConstant.Textcolor),
          ),
          centerTitle: true,
        ),
        body: Center(child: Obx(() {
          return Text(controller.Counter.toString(),
              style: const TextStyle(fontSize: 40));
        })),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.IncrementCounter();
          },
          child: const Icon(Icons.add),
        ));
  }
}
