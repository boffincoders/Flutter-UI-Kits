import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screens/messenger/controller/chat_list_controller.dart';
import 'package:flutter_ui_kit/screens/messenger/controller/home_controller.dart';
import 'package:flutter_ui_kit/screens/messenger/controller/profile_controller.dart';
import 'package:flutter_ui_kit/screens/messenger/style/text.dart';
import 'package:flutter_ui_kit/screens/messenger/views/chat_list.dart';
import 'package:flutter_ui_kit/screens/messenger/views/profile.dart';
import 'package:get/get.dart';

class MessengerHome extends GetView<HomeController> {
  const MessengerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(ChatListController());
    Get.put(ProfileController());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => Column(
            children: [
              Expanded(
                  child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                controller.profile?.value.avatar == null
                                    ? CircularProgressIndicator()
                                    : Image.asset(
                                        controller.profile?.value.avatar ?? ""),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.profile?.value.status ?? "",
                                      style: textMsg(),
                                    ),
                                    Text(
                                      controller.profile?.value.name ?? "",
                                      style: textName(),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color: Color(0xffEFEFEF),
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: Image.asset(
                                    "assets/images/messenger/drawer.png")),
                          ],
                        )),
                    Expanded(
                      child: TabBarView(
                        controller: controller.controller?.value,
                        children: [
                          ChatList(),
                          Profile(),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
              Container(
                color: Color(0xffF5F5F5),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0))),
                  child: SafeArea(
                    top: false,
                    child: TabBar(
                      controller: controller.controller?.value,
                      indicatorColor: Colors.transparent,
                      labelPadding: EdgeInsets.zero,
                      tabs: [
                        Container(
                          width: width * .5,
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color: Colors.grey, width: .5))),
                          child: Tab(
                            icon: Image.asset(
                                controller.selectedIndex.value == 0
                                    ? "assets/images/messenger/chat.png"
                                    : "assets/images/messenger/chatu.png"),
                          ),
                        ),
                        Container(
                          width: width * .5,
                          decoration: BoxDecoration(
                              border: Border(
                                  left: BorderSide(
                                      color: Colors.grey, width: .5))),
                          child: Tab(
                            icon: Image.asset(
                                controller.selectedIndex.value == 1
                                    ? "assets/images/messenger/users.png"
                                    : "assets/images/messenger/user.png"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
