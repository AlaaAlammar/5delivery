import 'dart:convert';

List<Report > reportFromJson(String str) {
    final jsonData = json.decode(str);
    return List<Report >.from(jsonData.map((x) => Report .fromJson(x)));
}

String reportToJson(List<Report > data) {
    final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
    return json.encode(dyn);
}

class Report {
    int id;
    String userName;
    String fileName;
    String groupName;
    String theOperation;
    String theTime;
    String createdAt;
    String updatedAt;

    Report ({
        required this.id,
       required  this.userName,
       required  this.fileName,
        required this.groupName,
        required this.theOperation,
        required this.theTime,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Report.fromJson(Map<String, dynamic> json) => Report (
        id: json["id"],
        userName: json["user_name"],
        fileName: json["file_name"],
        groupName: json["group_name"],
        theOperation: json["the_operation"],
        theTime: json["the_time"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": userName,
        "file_name": fileName,
        "group_name": groupName,
        "the_operation": theOperation,
        "the_time": theTime,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
