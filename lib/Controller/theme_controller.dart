import 'package:get/get.dart';

class Theme_Controller extends GetxController {
  RxBool isDark = false.obs;

  toggleMode() {
    isDark.toggle();
  }
}
