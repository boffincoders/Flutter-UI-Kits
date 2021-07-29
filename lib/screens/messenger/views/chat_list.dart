import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_ui_kit/screens/messenger/common/utils.dart';
import 'package:flutter_ui_kit/screens/messenger/controller/chat_list_controller.dart';
import 'package:flutter_ui_kit/screens/messenger/style/text.dart';
import 'package:flutter_ui_kit/screens/messenger/views/chat_screen.dart';
import 'package:get/get.dart';

class ChatList extends GetView<ChatListController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 15.0),
          child: Row(
            children: [
              Container(
                width: width * .6,
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
                          hintText: "Search your friend",
                          hintStyle: TextStyle(
                              color: Color(0xff0C0020).withOpacity(.5)),
                          border: InputBorder.none,
                        ).copyWith(isDense: true),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: width * .2,
                height: 50.0,
                margin: EdgeInsets.only(left: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                    color: Color(0xffEFEFEF),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/images/messenger/ellipse.png"),
                      Text(
                        '110',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(12, 0, 32, 1),
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
            child: Container(
          color: Color(0xffF5F5F5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80.0,
                margin: EdgeInsets.only(left: 20.0, top: 20.0),
                child: ListView.builder(
                    itemCount: controller.listStatus.length + 1,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      if (index == 0)
                        return Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Stack(
                            children: [
                              controller.homeController.profile?.value.avatar ==
                                      null
                                  ? CircularProgressIndicator()
                                  : Image.asset(controller.homeController
                                          .profile?.value.avatar ??
                                      ""),
                              Positioned.fill(
                                  child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    color: Color(0xffF6F6F6),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    size: 15.0,
                                  ),
                                ),
                              ))
                            ],
                          ),
                        );
                      else {
                        var item = controller.listStatus[index - 1];
                        return Container(
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.only(left: 20.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(
                            children: [
                              Image.asset(
                                item.avatar!,
                                height: 50,
                                width: 50,
                              ),
                              Text(
                                item.name!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(12, 0, 32, 1),
                                    fontFamily: 'Roboto',
                                    fontSize: 10,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )
                            ],
                          ),
                        );
                      }
                    }),
              ),
              Expanded(
                  child: Container(
                color: Color(0xffF5F5F5),
                margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: ListView.builder(
                    itemCount: controller.chatMessage.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      var item = controller.chatMessage[index];
                      return GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          if (index == 0)
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => ChatScreen(item)));
                        },
                        child: Slidable(
                            actionPane: SlidableStrechActionPane(),
                            controller: controller.slidableController?.value,
                            key: Key(item.id.toString()),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20.0),
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Row(
                                children: [
                                  Container(
                                    height: 54.0,
                                    width: 54.0,
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          item.avatar!,
                                          height: 50.0,
                                          width: 50.0,
                                        ),
                                        Positioned(
                                            bottom: 0,
                                            child: Image.asset(
                                              item.onlineStatus == 1
                                                  ? "assets/images/messenger/online.png"
                                                  : "assets/images/messenger/offline.png",
                                            ))
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Expanded(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.name!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: textName2(),
                                          ),
                                          Text(
                                            controller.homeController.profile
                                                        ?.value.id ==
                                                    item.senderId
                                                ? "You: ${item.lastMessage!}"
                                                : item.lastMessage!,
                                            style: textMsg2(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            Utils().getFormattedDate(
                                                item.lastMessageDateTime!),
                                            style: textMsg(),
                                          ),
                                          Text(
                                            Utils().getFormattedTime(
                                                item.lastMessageDateTime!),
                                            style: textMsg2(),
                                          )
                                        ],
                                      )
                                    ],
                                  ))
                                ],
                              ),
                            ),
                            secondaryActions: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 20.0),
                                alignment: Alignment.center,
                                child: IconSlideAction(
                                  caption: 'Archive',
                                  color: Color(0xff6CDA51),
                                  icon: Icons.archive,
                                  onTap: () async {},
                                ),
                              ),
                            ]),
                      );
                    }),
              )),
            ],
          ),
        ))
      ],
    );
  }
}
