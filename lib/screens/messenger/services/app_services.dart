import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_ui_kit/screens/messenger/models/friend_list.dart';
import 'package:flutter_ui_kit/screens/messenger/models/message.dart';
import 'package:flutter_ui_kit/screens/messenger/models/status.dart';
import 'package:flutter_ui_kit/screens/messenger/models/user_profile.dart';

class MessengerAppService {
  Future<UserProfile> loadUserData() async {
    var jsonText =
        await rootBundle.loadString('assets/images/messenger/json/person.json');
    var data = json.decode(jsonText);
    return UserProfile.fromMap(data);
  }

  Future<FriendStatus> loadFriendsStatus() async {
    var jsonText =
        await rootBundle.loadString('assets/images/messenger/json/status.json');
    var data = json.decode(jsonText);
    return FriendStatus.fromMap(data);
  }

  Future<List<FriendsList>> loadLastMessage() async {
    var jsonText = await rootBundle
        .loadString('assets/images/messenger/json/friends.json');
    var data = json.decode(jsonText);

    return (data['friends_list'] as List)
        .map((e) => FriendsList.fromMap(e))
        .toList()
          ..sort((a, b) =>
              DateTime.fromMillisecondsSinceEpoch(b.lastMessageDateTime! * 1000)
                  .compareTo(DateTime.fromMillisecondsSinceEpoch(
                      a.lastMessageDateTime! * 1000)));
  }

  Future<List<MessagesList>> loadChatMessages() async {
    var jsonText = await rootBundle
        .loadString('assets/images/messenger/json/message.json');
    var data = json.decode(jsonText);

    return (data['messagesList'] as List)
        .map((e) => MessagesList.fromMap(e))
        .toList()
          ..sort((a, b) => a.dateTime!.compareTo(b.dateTime!));
  }
}
