import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/Api%20controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Obx(
        () => controller.isloading.value
            ? Center(child: const CircularProgressIndicator.adaptive())
            : Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: controller.emailController.value,
                      decoration: const InputDecoration(hintText: "Email"),
                    ),
                    TextFormField(
                      controller: controller.passcontroller.value,
                      decoration: const InputDecoration(hintText: "Password"),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.loginApiCall();
                        },
                        child: const Text("Login"))
                  ],
                ),
              ),
      ),
    );
  }
}
