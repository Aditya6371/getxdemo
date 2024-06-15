import 'dart:developer';

import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class ImagePickerController extends GetxController {
  RxString imagePath = "".obs;

  Future<void> getImageFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final img =
        await _picker.pickImage(source: ImageSource.camera);
    if (img != null) {
      log(img.path.toString());
      imagePath.value = img.path.toString();
    }
  }

  Future<void> getImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final img =
        await _picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      log(img.path.toString());
      imagePath.value = img.path.toString();
    }
  }
}
