import 'package:get/get.dart';

class Counter_Controller extends GetxController {
  RxInt Counter = 1.obs;

  IncrementCounter() {
    Counter.value++;
  }
}


