import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passcontroller = TextEditingController().obs;

  RxBool isloading = false.obs;

  loginApiCall() async {
    isloading.value = true;
    try {
      final respone = await post(Uri.parse('https://reqres.in/api/login'),
          body: {
            'email': emailController.value.text,
            'password': passcontroller.value.text
          });
      log(respone.statusCode.toString());
      var data = jsonDecode(respone.body);
      if (respone.statusCode == 200) {
        isloading.value = false;
        Get.snackbar("Login Successfull", "Valid Credentials");
      } else {
        isloading.value = false;
        Get.snackbar("Login UnSuccessfull", data['error']);
      }
    } catch (e) {
      isloading.value = false;
      log(e.toString());
    }
  }
}
