// To parse this JSON data, do
//
//     final findjobs = findjobsFromJson(jsonString);

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hires/core/constants/constants.dart';
import 'package:hires/core/utils/common_utils.dart';
import 'package:hires/models/job_model.dart';
import 'package:hires/presentation/homepage_3_screen/widgets/featured_jobs.dart';
import 'package:hires/services/get_services.dart';

import '../services/post_services.dart';

// Findjobs findjobsFromJson(String str) => Findjobs.fromJson(json.decode(str));

// String findjobsToJson(Findjobs data) => json.encode(data.toJson());

class WishlistModel {
  WishlistModel({
    this.data,
  });

  List<Wishlist>? data;

  factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
        data: json["data"] == null
            ? null
            : List<Wishlist>.from(
                json["data"].map((x) => Wishlist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<Wishlist>.from(data!.map((x) => x.toJson())),
      };
}

// "job": {

// },
// "candidate": null,

class Wishlist {
  Wishlist(
      {this.id,
      this.objectId,
      this.objectModel,
      this.userId,
      this.createUser,
      this.updateUser,
      this.createdAt,
      this.updatedAt,
      this.job,
      this.company});
  int? id;
  int? objectId;
  String? objectModel;
  int? userId;
  int? createUser;
  int? updateUser;
  DateTime? createdAt;
  DateTime? updatedAt;

  // String? thumbnailImage;
  JobWL? job;
  CompanyJob? company;

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        id: json["id"] == null ? null : json["id"],
        objectId: json["object_id"] == null ? null : json["object_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        createUser: json["create_user"] == null ? null : json["create_user"],
        updateUser: json["update_user"] == null ? null : json["update_user"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        job: json["job"] == null ? null : JobWL.fromJson(json["job"]),
        company: json["company"] == null
            ? null
            : CompanyJob.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "object_id": objectId == null ? null : objectId,
        "user_id": userId == null ? null : userId,
        "create_user": createUser == null ? null : createUser,
        "update_user": updateUser == null ? null : updateUser,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "job": job == null ? null : job!.toJson(),
        "company": company == null ? null : company!.toJson(),
      };
}

class JobWL {
  JobWL({
    this.id,
    this.title,
    this.slug,
    this.content,
    this.categoryId,
    this.thumbnailId,
    this.locationId,
    this.companyId,
    this.jobTypeId,
    this.expirationDate,
    this.hours,
    this.hoursType,
    this.salaryType,
    this.salaryMin,
    this.salaryMax,
    this.gender,
    this.mapLat,
    this.mapLng,
    this.mapZoom,
    this.experience,
    this.isFeatured,
    this.isUrgent,
    this.status,
    this.deletedAt,
    this.createUser,
    this.updateUser,
    this.createdAt,
    this.updatedAt,
    this.applyType,
    this.applyLink,
    this.applyEmail,
    this.gallery,
    this.video,
    this.videoCoverId,
    this.numberRecruitments,
    this.wageAgreement,
  });

  int? id;
  String? title;
  String? slug;
  dynamic content;
  int? categoryId;
  int? thumbnailId;
  int? locationId;
  int? companyId;
  int? jobTypeId;
  DateTime? expirationDate;
  String? hours;
  String? hoursType;
  String? salaryType;
  String? salaryMin;
  String? salaryMax;
  String? gender;
  dynamic mapLat;
  dynamic mapLng;
  int? mapZoom;
  int? experience;
  int? isFeatured;
  int? isUrgent;
  String? status;
  dynamic deletedAt;
  int? createUser;
  int? updateUser;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic applyType;
  dynamic applyLink;
  dynamic applyEmail;
  dynamic gallery;
  dynamic video;
  dynamic videoCoverId;
  int? numberRecruitments;
  dynamic wageAgreement;

  factory JobWL.fromJson(Map<String, dynamic> json) => JobWL(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
        content: json["content"] == null ? null : json["content"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        thumbnailId: json["thumbnail_id"],
        locationId: json["location_id"] == null ? null : json["location_id"],
        companyId: json["company_id"] == null ? null : json["company_id"],
        jobTypeId: json["job_type_id"] == null ? null : json["job_type_id"],
        expirationDate: json["expiration_date"] == null
            ? null
            : DateTime.parse(json["expiration_date"]),
        hours: json["hours"] == null ? null : json["hours"],
        hoursType: json["hours_type"] == null ? null : json["hours_type"],
        salaryType: json["salary_type"] == null ? null : json["salary_type"],
        salaryMin: json["salary_min"] == null ? null : json["salary_min"],
        salaryMax: json["salary_max"] == null ? null : json["salary_max"],
        gender: json["gender"] == null ? null : json["gender"],
        mapLat: json["map_lat"],
        mapLng: json["map_lng"],
        mapZoom: json["map_zoom"] == null ? null : json["map_zoom"],
        experience: json["experience"] == null ? null : json["experience"],
        isFeatured: json["is_featured"] == null ? null : json["is_featured"],
        isUrgent: json["is_urgent"] == null ? null : json["is_urgent"],
        status: json["status"] == null ? null : json["status"],
        deletedAt: json["deleted_at"],
        createUser: json["create_user"] == null ? null : json["create_user"],
        updateUser: json["update_user"] == null ? null : json["update_user"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        applyType: json["apply_type"],
        applyLink: json["apply_link"],
        applyEmail: json["apply_email"],
        gallery: json["gallery"],
        video: json["video"],
        videoCoverId: json["video_cover_id"],
        numberRecruitments: json["number_recruitments"] == null
            ? null
            : json["number_recruitments"],
        wageAgreement: json["wage_agreement"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
        "content": content == null ? null : content,
        "category_id": categoryId == null ? null : categoryId,
        "thumbnail_id": thumbnailId,
        "location_id": locationId == null ? null : locationId,
        "company_id": companyId == null ? null : companyId,
        "job_type_id": jobTypeId == null ? null : jobTypeId,
        "expiration_date":
            expirationDate == null ? null : expirationDate!.toIso8601String(),
        "hours": hours == null ? null : hours,
        "hours_type": hoursType == null ? null : hoursType,
        "salary_type": salaryType == null ? null : salaryType,
        "salary_min": salaryMin == null ? null : salaryMin,
        "salary_max": salaryMax == null ? null : salaryMax,
        "gender": gender == null ? null : gender,
        "map_lat": mapLat,
        "map_lng": mapLng,
        "map_zoom": mapZoom == null ? null : mapZoom,
        "experience": experience == null ? null : experience,
        "is_featured": isFeatured == null ? null : isFeatured,
        "is_urgent": isUrgent == null ? null : isUrgent,
        "status": status == null ? null : status,
        "deleted_at": deletedAt,
        "create_user": createUser == null ? null : createUser,
        "update_user": updateUser == null ? null : updateUser,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "apply_type": applyType,
        "apply_link": applyLink,
        "apply_email": applyEmail,
        "gallery": gallery,
        "video": video,
        "video_cover_id": videoCoverId,
        "number_recruitments":
            numberRecruitments == null ? null : numberRecruitments,
        "wage_agreement": wageAgreement,
      };
}

class WishlistProvider extends ChangeNotifier {
  WishlistModel? wishlistModel;

  bool statusLogin = false;
  String mssgLogin = '';
  String emailToVerify = '';
  String resetTypeToVerify = '';
  String token = "";

  Future intit(String token) async {
    this.token = token;
    await getWishlist(this.token);

    // await findPobularJobs();
  }

  Future<WishlistModel?> getWishlist(String token) async {
    var body = await GetServices.getWishlist(token);
    if (body["status"]) {
      if (body != null) {
        var data = body["data"];
        //applicantDetail = ApplicantDetailModel.fromJson();
        wishlistModel = WishlistModel.fromJson(data);
        notifyListeners();
        //print(jobsModel);
        return wishlistModel;
      }
    }
  }

  Future<bool?> addWishlist(String id_job, String token) async {
    var body = await PostServices.addWishlist(id_job, token);

    var mssg = body['message'] ?? Constants.mssgErrTryLater;
    if (body['message'].toString().trim().isEmpty) {
      mssg = Constants.mssgErrTryLater;
      await getToastMessage(mssg, Colors.red);
      return false;
    } else {
      await getToastMessage(mssg, Colors.red);
      return false;
    }
  }

  Future<bool?> remoteWishlist(String id_job, String token) async {
    var body = await PostServices.remoteWishlist(id_job, token);

    var mssg = body['message'] ?? Constants.mssgErrTryLater;
    if (body['message'].toString().trim().isEmpty) {
      mssg = Constants.mssgErrTryLater;
      await getToastMessage(mssg, Colors.red);
      return false;
    } else if (body["status"]) {
      await getToastMessage(mssg, Colors.red);
      return true;
    } else {
      await getToastMessage(mssg, Colors.red);
      return false;
    }
  }
}
