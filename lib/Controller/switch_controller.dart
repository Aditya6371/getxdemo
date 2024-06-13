import 'package:get/get.dart';

class SwitchController extends GetxController {
  RxBool isOn = false.obs;

  changeValue(val) {
    isOn.value = val;
  }
}
