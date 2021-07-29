import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screens/messenger/models/user_profile.dart';
import 'package:flutter_ui_kit/screens/messenger/services/app_services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  var abc = 0.obs;
  Rx<TabController>? controller;
  var selectedIndex = 0.obs;
  MessengerAppService appService = MessengerAppService();
  Rx<UserProfile>? profile =UserProfile().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    controller = TabController(length: 2, vsync: this).obs;
    controller?.value.addListener(_handleTabSelection);
    getUserData();
  }

  _handleTabSelection() {
    selectedIndex.value = controller!.value.index;
  }

  getUserData() async {
    profile?.value = await appService.loadUserData();
  }
}
