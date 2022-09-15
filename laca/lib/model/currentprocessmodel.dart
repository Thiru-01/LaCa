import 'dart:convert';

CurrentProcessModel currentProcessModelFromJson(Map<String, dynamic> str) =>
    CurrentProcessModel.fromJson(str);

String currentProcessModelToJson(CurrentProcessModel data) =>
    json.encode(data.toJson());

class CurrentProcessModel {
  CurrentProcessModel({
    required this.id,
    required this.totalLine,
    required this.completedLine,
  });

  String id;
  int totalLine;
  int completedLine;

  factory CurrentProcessModel.fromJson(Map<String, dynamic> json) =>
      CurrentProcessModel(
        id: json["id"],
        totalLine: json["total_line"],
        completedLine: json["completed_line"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "total_line": totalLine,
        "completed_line": completedLine,
      };
}
