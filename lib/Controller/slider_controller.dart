import 'package:get/get.dart';

class slider_controller extends GetxController {
  RxDouble val = .4.obs;

  setValue(double newval) {
    val.value = newval;
  }
}
