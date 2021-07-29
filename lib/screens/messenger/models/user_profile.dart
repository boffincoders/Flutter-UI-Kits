import 'dart:convert';

UserProfile userProfileFromMap(String str) =>
    UserProfile.fromMap(json.decode(str));

String userProfileToMap(UserProfile data) => json.encode(data.toMap());

class UserProfile {
  UserProfile({
    this.id,
    this.name,
    this.email,
    this.avatar,
    this.status,
  });

  int? id;
  String? name;
  String? email;
  String? avatar;
  String? status;

  factory UserProfile.fromMap(Map<String, dynamic> json) => UserProfile(
        id: json["id"] == null ? 0 : json["id"],
        name: json["name"] == null ? "" : json["name"],
        email: json["email"] == null ? "" : json["email"],
        avatar: json["avatar"] == null ? "" : json["avatar"],
        status: json["status"] == null ? "" : json["status"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? 0 : id,
        "name": name == null ? "" : name,
        "email": email == null ? "" : email,
        "avatar": avatar == null ? "" : avatar,
        "status": status == null ? "" : status,
      };
}
