// ignore_for_file: non_constant_identifier_names

class Group {
  final int id;
  final String group_name;
  final String created_at;
  final String updated_at;

  Group(
      {required this.id,
      required this.group_name,
      required this.created_at,
      required this.updated_at});
      
  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
        id: json['id'],
        group_name: json['group_name'],
        created_at: json['created_at'],
        updated_at: json['updated_at']);
  }
}
