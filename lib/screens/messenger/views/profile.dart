import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screens/messenger/controller/profile_controller.dart';
import 'package:flutter_ui_kit/screens/messenger/style/text.dart';
import 'package:get/get.dart';

class Profile extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Container(
            width: width * .9,
            height: 50.0,
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xffEFEFEF),
                borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: Color(0xff0C0020).withOpacity(.5),
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller.search,
                    maxLines: 1,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration.collapsed(
                      hintText: "Search contacts",
                      hintStyle:
                          TextStyle(color: Color(0xff0C0020).withOpacity(.5)),
                      border: InputBorder.none,
                    ).copyWith(isDense: true),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
            child: Container(
          color: Color(0xffF5F5F5),
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: ListView.builder(
              itemCount: controller.chatController.chatMessage.length,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                var item = controller.chatController.chatMessage[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    children: [
                      Image.asset(
                        item.avatar!,
                        height: 50.0,
                        width: 50.0,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textName2(),
                              ),
                              Text(
                                item.email!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textMsg(),
                              ),
                            ],
                          ),
                          Image.asset("assets/images/messenger/chat.png"),
                        ],
                      ))
                    ],
                  ),
                );
              }),
        ))
      ],
    );
  }
}
