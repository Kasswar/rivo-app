// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  bool? success;
  String? message;
  Data? data;

  AuthModel({
    this.success,
    this.message,
    this.data,
  });

  AuthModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      AuthModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  User? user;

  Data({
    this.user,
  });

  Data copyWith({
    User? user,
  }) =>
      Data(
        user: user ?? this.user,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
      };
}

class User {
  int? id;
  String? fullname;
  String? username;
  String? phone;
  DateTime? dateOfBirth;
  int? gender;
  int? cityId;
  String? accessToken;
  Image? image;

  User({
    this.id,
    this.fullname,
    this.username,
    this.phone,
    this.dateOfBirth,
    this.gender,
    this.cityId,
    this.accessToken,
    this.image,
  });

  User copyWith({
    int? id,
    String? fullname,
    String? username,
    String? phone,
    DateTime? dateOfBirth,
    int? gender,
    int? cityId,
    String? accessToken,
    Image? image,
  }) =>
      User(
        id: id ?? this.id,
        fullname: fullname ?? this.fullname,
        username: username ?? this.username,
        phone: phone ?? this.phone,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        gender: gender ?? this.gender,
        cityId: cityId ?? this.cityId,
        accessToken: accessToken ?? this.accessToken,
        image: image ?? this.image,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullname: json["fullname"],
        username: json["username"],
        phone: json["phone"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        gender: json["gender"],
        cityId: json["city_id"],
        accessToken: json["access_token"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "username": username,
        "phone": phone,
        "date_of_birth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "city_id": cityId,
        "access_token": accessToken,
        "image": image?.toJson(),
      };
}

class Image {
  int? id;
  String? mediaUrl;
  String? thumbUrl;
  int? mediaType;
  String? hash;
  int? order;

  Image({
    this.id,
    this.mediaUrl,
    this.thumbUrl,
    this.mediaType,
    this.hash,
    this.order,
  });

  Image copyWith({
    int? id,
    String? mediaUrl,
    String? thumbUrl,
    int? mediaType,
    String? hash,
    int? order,
  }) =>
      Image(
        id: id ?? this.id,
        mediaUrl: mediaUrl ?? this.mediaUrl,
        thumbUrl: thumbUrl ?? this.thumbUrl,
        mediaType: mediaType ?? this.mediaType,
        hash: hash ?? this.hash,
        order: order ?? this.order,
      );

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        mediaUrl: json["media_url"],
        thumbUrl: json["thumb_url"],
        mediaType: json["media_type"],
        hash: json["hash"],
        order: json["order"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "media_url": mediaUrl,
        "thumb_url": thumbUrl,
        "media_type": mediaType,
        "hash": hash,
        "order": order,
      };
}
