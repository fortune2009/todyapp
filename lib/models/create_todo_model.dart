// To parse this JSON data, do
//
//     final createTodoResponse = createTodoResponseFromJson(jsonString);

import 'dart:convert';

CreateTodoResponse createTodoResponseFromJson(String str) =>
    CreateTodoResponse.fromJson(json.decode(str));

String createTodoResponseToJson(CreateTodoResponse data) =>
    json.encode(data.toJson());

class CreateTodoResponse {
  int? code;
  bool? success;
  int? timestamp;
  String? message;
  Data? data;

  CreateTodoResponse({
    this.code,
    this.success,
    this.timestamp,
    this.message,
    this.data,
  });

  factory CreateTodoResponse.fromJson(Map<String, dynamic> json) =>
      CreateTodoResponse(
        code: json["code"],
        success: json["success"],
        timestamp: json["timestamp"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "timestamp": timestamp,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  String? id;
  String? title;
  String? description;
  bool? isCompleted;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.title,
    this.description,
    this.isCompleted,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        isCompleted: json["is_completed"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "is_completed": isCompleted,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
