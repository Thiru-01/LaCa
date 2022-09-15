import 'dart:convert';

ContentModel contentModelFromJson(Map<String, dynamic> str) =>
    ContentModel.fromJson(str);

String contentModelToJson(ContentModel data) => json.encode(data.toJson());

class ContentModel {
  ContentModel({
    required this.id,
    required this.content,
  });

  String id;
  Map<String, dynamic> content;

  factory ContentModel.fromJson(Map<String, dynamic> json) => ContentModel(
        id: json["id"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
      };
}
