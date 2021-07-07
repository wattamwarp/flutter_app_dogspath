
// To parse this JSON data, do
//
//     final photosData = photosDataFromJson(jsonString);

import 'dart:convert';

List<PhotosData> photosDataFromJson(String str) => List<PhotosData>.from(json.decode(str).map((x) => PhotosData.fromJson(x)));

String photosDataToJson(List<PhotosData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotosData {
  PhotosData({
    this.id,
    this.title,
    this.subPaths,
    this.createdAt,
    this.name,
    this.avatar,
  });

  String id;
  String title;
  List<SubPath> subPaths;
  DateTime createdAt;
  String name;
  String avatar;

  factory PhotosData.fromJson(Map<String, dynamic> json) => PhotosData(
    id: json["id"],
    title: json["title"] == null ? null : json["title"],
    subPaths: json["sub_paths"] == null ? null : List<SubPath>.from(json["sub_paths"].map((x) => SubPath.fromJson(x))),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    name: json["name"] == null ? null : json["name"],
    avatar: json["avatar"] == null ? null : json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title == null ? null : title,
    "sub_paths": subPaths == null ? null : List<dynamic>.from(subPaths.map((x) => x.toJson())),
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "name": name == null ? null : name,
    "avatar": avatar == null ? null : avatar,
  };
}

class SubPath {
  SubPath({
    this.id,
    this.title,
    this.image,
  });

  String id;
  String title;
  String image;

  factory SubPath.fromJson(Map<String, dynamic> json) => SubPath(
    id: json["id"],
    title: json["title"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
  };
}
