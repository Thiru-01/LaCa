import 'dart:convert';

ResponseModel responseModelFromJson(Map<String, dynamic> str) =>
    ResponseModel.fromJson(str);

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  ResponseModel({
    required this.contents,
    required this.length,
    required this.fileName,
    required this.svg,
  });

  List<String> contents;
  int length;
  String fileName;
  String svg;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        contents: List<String>.from(json["contents"].map((x) => x)),
        length: json["length"],
        fileName: json["fileName"],
        svg: json["svg"],
      );

  Map<String, dynamic> toJson() => {
        "contents": List<dynamic>.from(contents.map((x) => x)),
        "length": length,
        "fileName": fileName,
        "svg": svg,
      };
}
