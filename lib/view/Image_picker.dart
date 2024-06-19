import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/imagePicker_controller.dart';
import '../res/Color.dart';

class ImagePicker extends StatelessWidget {
  final ImagePickerController controller = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker"),
      ),
      body: Obx(
        () => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                    radius: 80,
                    backgroundImage: controller.imagePath.isNotEmpty
                        ? FileImage(File(controller.imagePath.value))
                        : null),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    colorConstant.Primarycolor.withAlpha(80)),
                            onPressed: () async {
                              await controller.getImageFromCamera();
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.camera),
                                Text("Camera"),
                              ],
                            )),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    colorConstant.Primarycolor.withAlpha(80)),
                            onPressed: () async {
                              await controller.getImageFromGallery();
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.photo_album_outlined),
                                Text("Gallery"),
                              ],
                            )),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
