import 'dart:developer';

import 'package:get/get.dart';
import '/api/api.dart';
import '/global.dart';
import '/model/userModel.dart';

class userApiController extends GetxController {
  final RxList<Data> userData = <Data>[].obs;

  getUserData() async {
    final data = await Api.callGetApi(ApiConstant.UserListUrl);
    if (data != null) {
      var json = data['data'] as List;
      userData.value =
          json.map((e) => Data.fromJson(e as Map<String, dynamic>)).toList();
    } else {
      log("Data Is Null");
    }
  }
}
