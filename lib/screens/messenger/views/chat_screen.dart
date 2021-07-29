import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screens/messenger/common/utils.dart';
import 'package:flutter_ui_kit/screens/messenger/controller/chat_controller.dart';
import 'package:flutter_ui_kit/screens/messenger/models/friend_list.dart';
import 'package:flutter_ui_kit/screens/messenger/models/message.dart';
import 'package:flutter_ui_kit/screens/messenger/style/text.dart';
import 'package:get/get.dart';

class ChatScreen extends GetView<ChatController> {
  final FriendsList friendData;

  ChatScreen(this.friendData);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Get.put(ChatController());
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
                child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Container(
                    color: Color(0xffF5F5F5),
                    child: Container(
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () => Navigator.of(context).pop(),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Color(0xff0C0020),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Image.asset(friendData.avatar!),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  friendData.name!,
                                  style: textName(),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset("assets/images/messenger/call.png"),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Image.asset(
                                    "assets/images/messenger/video.png"),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Image.asset(
                                        "assets/images/messenger/drawer.png")),
                              ],
                            ),
                          ],
                        )),
                  ),
                  Expanded(
                    child: Container(
                      color: Color(0xffF5F5F5),
                      child: Column(
                        children: [
                          Expanded(
                              child: Container(
                            child: Obx(
                              () => ListView.builder(
                                  itemCount: controller.chatMessages.length,
                                  shrinkWrap: true,
                                  itemBuilder: (_, index) {
                                    var item = controller.chatMessages[index];
                                    return messageItemComponent(item, width);
                                  }),
                            ),
                          )),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 15.0),
                            color: Colors.white,
                            child: SafeArea(
                                top: false,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Color(0xff0C0020),
                                      size: 25.0,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 40.0,
                                        margin: EdgeInsets.only(
                                            left: 20.0, right: 20.0),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Color(0xffEFEFEF),
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller: controller.message,
                                                maxLines: 1,
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                decoration:
                                                    InputDecoration.collapsed(
                                                  hintText: "type text here",
                                                  hintStyle: TextStyle(
                                                      color: Color(0xff0C0020)
                                                          .withOpacity(.5)),
                                                  border: InputBorder.none,
                                                ).copyWith(isDense: true),
                                              ),
                                            ),
                                            Image.asset(
                                                "assets/images/messenger/moji.png")
                                          ],
                                        ),
                                      ),
                                    ),
                                    Image.asset(
                                        "assets/images/messenger/mic.png"),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Image.asset(
                                        "assets/images/messenger/send.png")
                                  ],
                                )),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ) //),
        );
  }

  Widget messageItemComponent(MessagesList item, double mWidth) {
    bool me = item.senderId == controller.homeController.profile?.value.id
        ? true
        : false;
    double marginL = me ? 25 : 15;
    double marginR = me ? 15 : 25;
    final width = item.message!.length > mWidth / 7 ? mWidth / 1.3 : null;
    return Container(
      child: Row(
        mainAxisAlignment: me ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.fromLTRB(marginL, 10, marginR, 10),
            decoration: BoxDecoration(
              color: me ? Color(0xff6C10FF) : Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: width,
              child: Column(
                crossAxisAlignment:
                    me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    item.message!,
                    style: TextStyle(
                      color: me ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        Utils().getFormattedDate2(item.dateTime!),
                        style: chatMsg(me),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        Utils().getFormattedTime2(item.dateTime!),
                        style: chatMsg(me),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
