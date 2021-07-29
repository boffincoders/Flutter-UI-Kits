// To parse this JSON data, do
//
//     final chatMessages = chatMessagesFromMap(jsonString);

import 'dart:convert';

ChatMessages chatMessagesFromMap(String str) =>
    ChatMessages.fromMap(json.decode(str));

String chatMessagesToMap(ChatMessages data) => json.encode(data.toMap());

class ChatMessages {
  ChatMessages({
    this.status,
    this.statusCode,
    this.messagesList,
  });

  bool? status;
  int? statusCode;
  List<MessagesList>? messagesList;

  factory ChatMessages.fromMap(Map<String, dynamic> json) => ChatMessages(
        status: json["status"] == null ? null : json["status"],
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        messagesList: json["messagesList"] == null
            ? null
            : List<MessagesList>.from(
                json["messagesList"].map((x) => MessagesList.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status == null ? null : status,
        "statusCode": statusCode == null ? null : statusCode,
        "messagesList": messagesList == null
            ? null
            : List<dynamic>.from(messagesList!.map((x) => x.toMap())),
      };
}

class MessagesList {
  MessagesList({
    this.id,
    this.message,
    this.senderId,
    this.receiverId,
    this.dateTime,
  });

  int? id;
  String? message;
  int? senderId;
  int? receiverId;
  DateTime? dateTime;

  factory MessagesList.fromMap(Map<String, dynamic> json) => MessagesList(
        id: json["id"] == null ? null : json["id"],
        message: json["message"] == null ? null : json["message"],
        senderId: json["senderId"] == null ? null : json["senderId"],
        receiverId: json["receiverId"] == null ? null : json["receiverId"],
        dateTime: json["dateTime"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["dateTime"] * 1000)
                .toUtc(),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "message": message == null ? null : message,
        "senderId": senderId == null ? null : senderId,
        "receiverId": receiverId == null ? null : receiverId,
        "dateTime": dateTime == null ? null : dateTime,
      };
}
