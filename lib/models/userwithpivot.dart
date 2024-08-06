import 'dart:convert';

List<UserWith> userwithFromJson(String str) {
    final jsonData = json.decode(str);
    return  List<UserWith>.from(jsonData.map((x) => UserWith.fromJson(x)));
}

String userwithToJson(List<UserWith> data) {
    final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
    return json.encode(dyn);
}

class UserWith {
    int id;
    String name;
    String email;
    dynamic emailVerifiedAt;
    String userType;
    String createdAt;
    String updatedAt;
    Pivot pivot;

    UserWith({
        required this.id,
        required this.name,
        required this.email,
        this.emailVerifiedAt,
        required this.userType,
        required this.createdAt,
        required this.updatedAt,
        required this.pivot,
    });

    factory UserWith.fromJson(Map<String, dynamic> json) => UserWith(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        userType: json["user_type"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        pivot: Pivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "user_type": userType,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "pivot": pivot.toJson(),
    };
}

class Pivot {
    int groupId;
    int userId;

    Pivot({
        required this.groupId,
        required this.userId,
    });

    factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        groupId: json["group_id"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "group_id": groupId,
        "user_id": userId,
    };
}
