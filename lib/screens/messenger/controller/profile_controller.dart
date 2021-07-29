import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screens/messenger/controller/chat_list_controller.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  TextEditingController search = TextEditingController();

  ChatListController chatController = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
