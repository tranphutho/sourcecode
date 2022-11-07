// To parse this JSON data, do
//
//     final getAllPlans = getAllPlansFromJson(jsonString);

import 'dart:convert';

GetAllPlans getAllPlansFromJson(String str) =>
    GetAllPlans.fromJson(json.decode(str));

String getAllPlansToJson(GetAllPlans data) => json.encode(data.toJson());

class GetAllPlans {
  GetAllPlans({
    this.status,
    this.data,
  });

  bool? status;
  List<Datum>? data;

  factory GetAllPlans.fromJson(Map<String, dynamic> json) => GetAllPlans(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.title,
    this.content,
    this.price,
    this.duration,
    this.durationType,
    this.annualPrice,
    this.maxService,
    this.status,
    this.roleId,
    this.isRecommended,
    this.deletedAt,
    this.createUser,
    this.updateUser,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  String? content;
  String? price;
  int? duration;
  String? durationType;
  String? annualPrice;
  int? maxService;
  String? status;
  int? roleId;
  int? isRecommended;
  dynamic deletedAt;
  int? createUser;
  int? updateUser;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        content: json["content"] == null ? null : json["content"],
        price: json["price"] == null ? null : json["price"],
        duration: json["duration"] == null ? null : json["duration"],
        durationType:
            json["duration_type"] == null ? null : json["duration_type"],
        annualPrice: json["annual_price"] == null ? null : json["annual_price"],
        maxService: json["max_service"] == null ? null : json["max_service"],
        status: json["status"] == null ? null : json["status"],
        roleId: json["role_id"] == null ? null : json["role_id"],
        isRecommended:
            json["is_recommended"] == null ? null : json["is_recommended"],
        deletedAt: json["deleted_at"],
        createUser: json["create_user"] == null ? null : json["create_user"],
        updateUser: json["update_user"] == null ? null : json["update_user"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "content": content == null ? null : content,
        "price": price == null ? null : price,
        "duration": duration == null ? null : duration,
        "duration_type": durationType == null ? null : durationType,
        "annual_price": annualPrice == null ? null : annualPrice,
        "max_service": maxService == null ? null : maxService,
        "status": status == null ? null : status,
        "role_id": roleId == null ? null : roleId,
        "is_recommended": isRecommended == null ? null : isRecommended,
        "deleted_at": deletedAt,
        "create_user": createUser == null ? null : createUser,
        "update_user": updateUser == null ? null : updateUser,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
