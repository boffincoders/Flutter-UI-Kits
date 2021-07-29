import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_ui_kit/screens/messenger/controller/home_controller.dart';
import 'package:flutter_ui_kit/screens/messenger/models/friend_list.dart';
import 'package:flutter_ui_kit/screens/messenger/models/status.dart';
import 'package:flutter_ui_kit/screens/messenger/models/user_profile.dart';
import 'package:flutter_ui_kit/screens/messenger/services/app_services.dart';
import 'package:get/get.dart';

class ChatListController extends GetxController {
  var test = "abc".obs;
  TextEditingController search = TextEditingController();
  MessengerAppService appService = MessengerAppService();
  HomeController homeController = Get.find();
  List<Status> listStatus = <Status>[].obs;
  List<FriendsList> chatMessage = <FriendsList>[].obs;
  Rx<SlidableController>? slidableController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    slidableController = SlidableController().obs;
    getFriendsStatus();
    getLastChatMessage();
  }

  getFriendsStatus() async {
    try {
      final statusData = await appService.loadFriendsStatus();
      listStatus.assignAll(statusData.status!);
    } catch (e) {
      print(e);
    }
  }

  getLastChatMessage() async {
    try {
      var data = await appService.loadLastMessage();
      chatMessage.assignAll(data);
    } catch (e) {
      print(e);
    }
  }
}
