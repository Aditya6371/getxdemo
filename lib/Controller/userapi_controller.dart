import 'dart:developer';

import 'package:get/get.dart';
import 'package:getxdemo/api/api.dart';
import 'package:getxdemo/model/userModel.dart';

class userApiController extends GetxController {
  final RxList<Data> userData = <Data>[].obs;

  getUserData() async {
    final data = await Api.callGetApi("https://reqres.in/api/users?page=2");
    if (data != null) {
      var json = data['data'] as List;
      userData.value =
          json.map((e) => Data.fromJson(e as Map<String, dynamic>)).toList();
    } else {
      log("Data Is Null");
    }
  }
}
