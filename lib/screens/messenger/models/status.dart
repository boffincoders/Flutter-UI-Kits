// To parse this JSON data, do
//
//     final friendStatus = friendStatusFromMap(jsonString);

import 'dart:convert';

FriendStatus friendStatusFromMap(String str) => FriendStatus.fromMap(json.decode(str));

String friendStatusToMap(FriendStatus data) => json.encode(data.toMap());

class FriendStatus {
  FriendStatus({
    this.status,
  });

  List<Status>? status;

  factory FriendStatus.fromMap(Map<String, dynamic> json) => FriendStatus(
    status: json["status"] == null ? null : List<Status>.from(json["status"].map((x) => Status.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status == null ? null : List<dynamic>.from(status!.map((x) => x.toMap())),
  };
}

class Status {
  Status({
    this.id,
    this.name,
    this.email,
    this.avatar,
  });

  int? id;
  String? name;
  String? email;
  String? avatar;

  factory Status.fromMap(Map<String, dynamic> json) => Status(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    avatar: json["avatar"] == null ? null : json["avatar"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "avatar": avatar == null ? null : avatar,
  };
}
