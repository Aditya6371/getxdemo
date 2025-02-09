import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Login.dart';
import 'UserListScreen.dart';
import 'Image_picker.dart';
import 'CounterScreen.dart';
import '../res/Color.dart';
import 'slider.dart';
import '../Controller/theme_controller.dart';
import 'TextFieldScreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

//Show BottomSheet
  showBottomSheet() {
    Get.bottomSheet(
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Bottom Sheet',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorConstant.CnlButton),
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: colorConstant.Textcolor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorConstant.CnfButton),
                        onPressed: () {
                          Get.back();
                          log("Confrim button Clicked");
                        },
                        child: Text(
                          'Confrim',
                          style: TextStyle(color: colorConstant.Textcolor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

//Show SnackBar
  showSnackBar() {
    Get.snackbar(
      "Hii, Test",
      "This Is a test",
      titleText: const Text(
        "Hii, Test",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 22,
        ),
      ),
      messageText: const Text(
        "This is a Test message",
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
      ),
      snackPosition: SnackPosition.TOP,
    );
  }

//Show Dialog
  showDialog() {
    Get.defaultDialog(
      title: "Hii,Test",
      content: const Text(
        "This is a text message",
        style: TextStyle(fontSize: 16),
      ),
      confirm: ElevatedButton(
        onPressed: () {
          log("Okaai Clicked");
        },
        child: const Text(
          "Ok",
        ),
      ),
      cancel: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: const Text(
          "Cancel",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Theme_Controller themeController = Get.put(Theme_Controller());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GetX Demo ",
        ),
        actions: [
          IconButton(onPressed: () {
            themeController.toggleMode();
          }, icon: Obx(() {
            return themeController.isDark.value
                ? const Icon(Icons.light_mode)
                : const Icon(
                    Icons.mode_night_outlined,
                    color: Colors.white,
                  );
          })),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.open_in_new_sharp),
              title: const Text("Snackbar"),
              onTap: () {
                showSnackBar();
              },
            ),
            ListTile(
              leading: const Icon(Icons.do_not_disturb_on_total_silence),
              title: const Text("Dialog"),
              onTap: () {
                showDialog();
              },
            ),
            ListTile(
              leading: const Icon(Icons.open_in_browser),
              title: const Text("BottomSheet"),
              onTap: () {
                showBottomSheet();
              },
            ),
            ListTile(
              leading: const Icon(Icons.timer),
              title: const Text("Counter"),
              onTap: () {
                Get.to(const Counterscreen(
                  title: "Counter Screen",
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.timer),
              title: const Text("Slider"),
              onTap: () {
                Get.to(const SliderScreen());
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text("Image Picker"),
              onTap: () {
                Get.to(ImagePicker());
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit_document),
              title: const Text("TextFields"),
              onTap: () {
                Get.to(const TestFieldScreen());
              },
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text("Login"),
              onTap: () {
                Get.to(const LoginScreen());
              },
            ),
            ListTile(
              leading: const Icon(Icons.supervised_user_circle),
              title: const Text("User List From Api"),
              onTap: () {
                Get.to(const UserListScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}
