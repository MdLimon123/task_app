// To parse this JSON data, do
//
//     final videoModel = videoModelFromMap(jsonString);

import 'dart:convert';

VideoModel videoModelFromMap(String str) =>
    VideoModel.fromMap(json.decode(str));

String videoModelToMap(VideoModel data) => json.encode(data.toMap());

class VideoModel {
  VideoModel({
    this.success,
    this.data,
  });

  bool? success;
  List<Datum>? data;

  factory VideoModel.fromMap(Map<String, dynamic> json) => VideoModel(
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
    this.id,
    this.caption,
    this.videoUrl,
    this.createdAt,
  });

  int? id;
  String? caption;
  String? videoUrl;
  DateTime? createdAt;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        caption: json["caption"],
        videoUrl: json["video_url"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "caption": caption,
        "video_url": videoUrl,
        "created_at": createdAt?.toIso8601String(),
      };
}
