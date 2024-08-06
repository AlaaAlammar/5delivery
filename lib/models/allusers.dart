// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<AllUsers> allusersFromJson(String str) {
    final jsonData = json.decode(str);
    return List<AllUsers>.from(jsonData.map((x) => AllUsers.fromJson(x)));
}

String allusersToJson(List<AllUsers> data) {
    final dyn =List<dynamic>.from(data.map((x) => x.toJson()));
    return json.encode(dyn);
}

class AllUsers {
    int id;
    String name;
    String email;
    dynamic emailVerifiedAt;
    String userType;
    String createdAt;
    String updatedAt;

    AllUsers({
        required this.id,
        required this.name,
        required this.email,
        this.emailVerifiedAt,
        required this.userType,
        required this.createdAt,
        required this.updatedAt,
    });

    factory AllUsers.fromJson(Map<String, dynamic> json) => AllUsers(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        userType: json["user_type"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "user_type": userType,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
