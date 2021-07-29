// To parse this JSON data, do
//
//     final friendStatus = friendStatusFromMap(jsonString);

import 'dart:convert';

LastChatMessage friendStatusFromMap(String str) =>
    LastChatMessage.fromMap(json.decode(str));

String friendStatusToMap(LastChatMessage data) => json.encode(data.toMap());

class LastChatMessage {
  LastChatMessage({
    this.friendsList,
  });

  List<FriendsList>? friendsList;

  factory LastChatMessage.fromMap(Map<String, dynamic> json) => LastChatMessage(
        friendsList: json["friends_list"] == null
            ? null
            : List<FriendsList>.from(
                json["friends_list"].map((x) => FriendsList.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "friends_list": friendsList == null
            ? null
            : List<dynamic>.from(friendsList!.map((x) => x.toMap())),
      };
}

class FriendsList {
  FriendsList({
    this.id,
    this.name,
    this.email,
    this.avatar,
    this.lastMessage,
    this.onlineStatus,
    this.senderId,
    this.receiverId,
    this.lastMessageDateTime,
  });

  int? id;
  String? name;
  String? email;
  String? avatar;
  String? lastMessage;
  int? onlineStatus;
  int? senderId;
  int? receiverId;
  int? lastMessageDateTime;

  factory FriendsList.fromMap(Map<String, dynamic> json) => FriendsList(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        lastMessage: json["lastMessage"] == null ? null : json["lastMessage"],
        onlineStatus:
            json["onlineStatus"] == null ? null : json["onlineStatus"],
        senderId: json["senderId"] == null ? null : json["senderId"],
        receiverId: json["receiverId"] == null ? null : json["receiverId"],
        lastMessageDateTime: json["lastMessageDateTime"] == null
            ? null
            : json["lastMessageDateTime"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "avatar": avatar == null ? null : avatar,
        "lastMessage": lastMessage == null ? null : lastMessage,
        "onlineStatus": onlineStatus == null ? null : onlineStatus,
        "senderId": senderId == null ? null : senderId,
        "receiverId": receiverId == null ? null : receiverId,
        "lastMessageDateTime":
            lastMessageDateTime == null ? null : lastMessageDateTime,
      };
}
