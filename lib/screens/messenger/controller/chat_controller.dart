import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screens/messenger/controller/home_controller.dart';
import 'package:flutter_ui_kit/screens/messenger/models/message.dart';
import 'package:flutter_ui_kit/screens/messenger/services/app_services.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  MessengerAppService appService = MessengerAppService();
  HomeController homeController = Get.find();
  List<MessagesList> chatMessages = <MessagesList>[].obs;
  TextEditingController message = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getChatMessages();
  }

  getChatMessages() async {
    try {
      var data = await appService.loadChatMessages();
      chatMessages.assignAll(data);
    } catch (e) {
      print(e);
    }
  }
}
