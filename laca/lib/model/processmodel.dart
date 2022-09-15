import 'dart:convert';

ProcessModel processModelFromJson(String str) =>
    ProcessModel.fromJson(json.decode(str));

String processModelToJson(ProcessModel data) => json.encode(data.toJson());

class ProcessModel {
  ProcessModel({
    required this.id,
    required this.name,
    required this.totalLine,
    required this.timestamp,
    required this.status,
  });

  String id;
  String name;
  int totalLine;
  String timestamp;
  String status;

  factory ProcessModel.fromJson(Map<String, dynamic> json) => ProcessModel(
        id: json["id"],
        name: json["name"],
        totalLine: json["total_line"],
        timestamp: json["timestamp"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "total_line": totalLine,
        "timestamp": timestamp,
        "status": status,
      };
}
