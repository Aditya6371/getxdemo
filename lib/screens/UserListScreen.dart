
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/Controller/Api%20controller/userapi_controller.dart';

import '../model/userModel.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final userApiController controller = Get.put(userApiController());

  @override
  void initState() {
    super.initState();
    controller.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("User List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          return Center(
            child: controller.userData.isEmpty
                ? const CircularProgressIndicator()
                : ListView.builder(
                    itemCount: controller.userData.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Data userData = controller.userData[index];
                      return ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CircleAvatar(
                            child: Image.network(userData.avatar ?? ''),
                          ),
                        ),
                        title:
                            Text("${userData.firstName} ${userData.lastName}"),
                        subtitle: Text(userData.email ?? ''),
                      );
                    },
                  ),
          );
        }),
      ),
    );
  }
}