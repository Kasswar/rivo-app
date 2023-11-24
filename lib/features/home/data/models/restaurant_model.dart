// To parse this JSON data, do
//
//     final restaurantModel = restaurantModelFromJson(jsonString);

import 'dart:convert';

RestaurantModel restaurantModelFromJson(String str) =>
    RestaurantModel.fromJson(json.decode(str));

String restaurantModelToJson(RestaurantModel data) =>
    json.encode(data.toJson());

class RestaurantModel {
  bool? success;
  String? message;
  Data? data;

  RestaurantModel({
    this.success,
    this.message,
    this.data,
  });

  RestaurantModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      RestaurantModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      RestaurantModel(
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
  List<SubscribedResturant>? subscribedResturants;
  int? total;

  Data({
    this.subscribedResturants,
    this.total,
  });

  Data copyWith({
    List<SubscribedResturant>? subscribedResturants,
    int? total,
  }) =>
      Data(
        subscribedResturants: subscribedResturants ?? this.subscribedResturants,
        total: total ?? this.total,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        subscribedResturants: json["subscribed_resturants"] == null
            ? []
            : List<SubscribedResturant>.from(json["subscribed_resturants"]!
                .map((x) => SubscribedResturant.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "subscribed_resturants": subscribedResturants == null
            ? []
            : List<dynamic>.from(subscribedResturants!.map((x) => x.toJson())),
        "total": total,
      };
}

class SubscribedResturant {
  int? id;
  String? name;
  String? color;
  BannerImage? bannerImage;

  SubscribedResturant({
    this.id,
    this.name,
    this.color,
    this.bannerImage,
  });

  SubscribedResturant copyWith({
    int? id,
    String? name,
    String? color,
    BannerImage? bannerImage,
  }) =>
      SubscribedResturant(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
        bannerImage: bannerImage ?? this.bannerImage,
      );

  factory SubscribedResturant.fromJson(Map<String, dynamic> json) =>
      SubscribedResturant(
        id: json["id"],
        name: json["name"],
        color: json["color"],
        bannerImage: json["banner_image"] == null
            ? null
            : BannerImage.fromJson(json["banner_image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color,
        "banner_image": bannerImage?.toJson(),
      };
}

class BannerImage {
  int? id;
  String? mediaUrl;
  String? thumbUrl;
  dynamic mediaType;
  String? hash;
  int? order;

  BannerImage({
    this.id,
    this.mediaUrl,
    this.thumbUrl,
    this.mediaType,
    this.hash,
    this.order,
  });

  BannerImage copyWith({
    int? id,
    String? mediaUrl,
    String? thumbUrl,
    dynamic mediaType,
    String? hash,
    int? order,
  }) =>
      BannerImage(
        id: id ?? this.id,
        mediaUrl: mediaUrl ?? this.mediaUrl,
        thumbUrl: thumbUrl ?? this.thumbUrl,
        mediaType: mediaType ?? this.mediaType,
        hash: hash ?? this.hash,
        order: order ?? this.order,
      );

  factory BannerImage.fromJson(Map<String, dynamic> json) => BannerImage(
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
