// To parse this JSON data, do
//
//     final findjobs = findjobsFromJson(jsonString);

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hires/core/constants/constants.dart';
import 'package:hires/core/utils/common_utils.dart';
import 'package:hires/presentation/homepage_3_screen/widgets/featured_jobs.dart';
import 'package:hires/services/get_services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../services/post_services.dart';
import 'job_model.dart';

// Findjobs findjobsFromJson(String str) => Findjobs.fromJson(json.decode(str));

// String findjobsToJson(Findjobs data) => json.encode(data.toJson());

class MyJobsModel {
  MyJobsModel({
    this.data,
  });

  List<Job>? data;

  factory MyJobsModel.fromJson(Map<String, dynamic> json) => MyJobsModel(
        data: json["data"] == null
            ? null
            : List<Job>.from(json["data"].map((x) => Job.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data":
            data == null ? null : List<Job>.from(data!.map((x) => x.toJson())),
      };
}

class MyJob {
  MyJob(
      {this.id,
      this.title,
      this.content,
      this.thumbnailId,
      this.categoryId,
      this.locationId,
      this.jobTypeId,
      this.expirationDate,
      this.hours,
      this.hoursType,
      this.salaryMin,
      this.salaryMax,
      this.salaryType,
      this.gender,
      this.mapLat,
      this.mapLng,
      this.mapZoom,
      this.experience,
      this.isFeatured,
      this.isUrgent,
      this.status,
      this.applyType,
      this.applyLink,
      this.applyEmail,
      this.wageAgreement,
      this.gallery,
      this.video,
      this.videoCoverId,
      this.numberRecruitment,
      this.jobSkills});

  int? id;
  String? title;
  String? content;
  int? thumbnailId;
  int? categoryId;
  int? locationId;
  int? jobTypeId;
  String? expirationDate;
  String? hours;
  String? hoursType;
  int? salaryMin;
  int? salaryMax;
  String? salaryType;
  String? gender;
  String? mapLat;
  String? mapLng;
  int? mapZoom;
  int? experience;
  int? isFeatured;
  String? isUrgent;
  String? status;
  String? applyType;
  String? applyLink;
  String? applyEmail;
  int? wageAgreement;
  String? gallery;
  String? video;
  String? videoCoverId;
  int? numberRecruitment;
  List<int>? jobSkills;
}

// class Category {
//   Category({
//     this.id,
//     this.name,
//     this.content,
//     this.slug,
//     this.status,
//     this.originId,
//     this.icon,
//     this.lang,
//     this.lft,
//     this.rgt,
//     this.parentId,
//     this.createUser,
//     this.updateUser,
//     this.deletedAt,
//     this.createdAt,
//     this.updatedAt,
//   });

//   int? id;
//   String? name;
//   dynamic content;
//   String? slug;
//   String? status;
//   dynamic originId;
//   dynamic icon;
//   dynamic lang;
//   int? lft;
//   int? rgt;
//   int? parentId;
//   int? createUser;
//   dynamic updateUser;
//   dynamic deletedAt;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         id: json["id"] == null ? null : json["id"],
//         name: json["name"] == null ? null : json["name"],
//         content: json["content"],
//         slug: json["slug"] == null ? null : json["slug"],
//         status: json["status"] == null ? null : json["status"],
//         originId: json["origin_id"],
//         icon: json["icon"],
//         lang: json["lang"],
//         lft: json["_lft"] == null ? null : json["_lft"],
//         rgt: json["_rgt"] == null ? null : json["_rgt"],
//         parentId: json["parent_id"] == null ? null : json["parent_id"],
//         createUser: json["create_user"] == null ? null : json["create_user"],
//         updateUser: json["update_user"],
//         deletedAt: json["deleted_at"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "name": name == null ? null : name,
//         "content": content,
//         "slug": slug == null ? null : slug,
//         "status": status == null ? null : status,
//         "origin_id": originId,
//         "icon": icon,
//         "lang": lang,
//         "_lft": lft == null ? null : lft,
//         "_rgt": rgt == null ? null : rgt,
//         "parent_id": parentId == null ? null : parentId,
//         "create_user": createUser == null ? null : createUser,
//         "update_user": updateUser,
//         "deleted_at": deletedAt,
//         "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
//         "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
//       };
// }

// class Company {
//   Company({
//     this.id,
//     this.name,
//     this.email,
//     this.phone,
//     this.website,
//     this.avatarId,
//     this.coverId,
//     this.foundedIn,
//     this.allowSearch,
//     this.isFeatured,
//     this.ownerId,
//     this.locationId,
//     this.categoryId,
//     this.teamSize,
//     this.about,
//     this.socialMedia,
//     this.city,
//     this.state,
//     this.country,
//     this.zipCode,
//     this.address,
//     this.slug,
//     this.status,
//     this.createUser,
//     this.updateUser,
//     this.mapLat,
//     this.mapLng,
//     this.deletedAt,
//     this.createdAt,
//     this.updatedAt,
//   });

//   int? id;
//   String? name;
//   String? email;
//   String? phone;
//   String? website;
//   int? avatarId;
//   dynamic coverId;
//   String? foundedIn;
//   int? allowSearch;
//   dynamic isFeatured;
//   int? ownerId;
//   int? locationId;
//   int? categoryId;
//   int? teamSize;
//   String? about;
//   SocialMedia? socialMedia;
//   String? city;
//   String? state;
//   String? country;
//   int? zipCode;
//   String? address;
//   String? slug;
//   String? status;
//   int? createUser;
//   int? updateUser;
//   dynamic mapLat;
//   dynamic mapLng;
//   dynamic deletedAt;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   factory Company.fromJson(Map<String, dynamic> json) => Company(
//         id: json["id"] == null ? null : json["id"],
//         name: json["name"] == null ? null : json["name"],
//         email: json["email"] == null ? null : json["email"],
//         phone: json["phone"] == null ? null : json["phone"],
//         website: json["website"] == null ? null : json["website"],
//         avatarId: json["avatar_id"] == null ? null : json["avatar_id"],
//         coverId: json["cover_id"],
//         foundedIn: json["founded_in"] == null ? null : json["founded_in"],
//         allowSearch: json["allow_search"] == null ? null : json["allow_search"],
//         isFeatured: json["is_featured"],
//         ownerId: json["owner_id"] == null ? null : json["owner_id"],
//         locationId: json["location_id"] == null ? null : json["location_id"],
//         categoryId: json["category_id"] == null ? null : json["category_id"],
//         teamSize: json["team_size"] == null ? null : json["team_size"],
//         about: json["about"] == null ? null : json["about"],
//         socialMedia: json["social_media"] == null
//             ? null
//             : SocialMedia.fromJson(json["social_media"]),
//         city: json["city"] == null ? null : json["city"],
//         state: json["state"] == null ? null : json["state"],
//         country: json["country"] == null ? null : json["country"],
//         zipCode: json["zip_code"] == null ? null : json["zip_code"],
//         address: json["address"] == null ? null : json["address"],
//         slug: json["slug"] == null ? null : json["slug"],
//         status: json["status"] == null ? null : json["status"],
//         createUser: json["create_user"] == null ? null : json["create_user"],
//         updateUser: json["update_user"] == null ? null : json["update_user"],
//         mapLat: json["map_lat"],
//         mapLng: json["map_lng"],
//         deletedAt: json["deleted_at"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "name": name == null ? null : name,
//         "email": email == null ? null : email,
//         "phone": phone == null ? null : phone,
//         "website": website == null ? null : website,
//         "avatar_id": avatarId == null ? null : avatarId,
//         "cover_id": coverId,
//         "founded_in": foundedIn == null ? null : foundedIn,
//         "allow_search": allowSearch == null ? null : allowSearch,
//         "is_featured": isFeatured,
//         "owner_id": ownerId == null ? null : ownerId,
//         "location_id": locationId == null ? null : locationId,
//         "category_id": categoryId == null ? null : categoryId,
//         "team_size": teamSize == null ? null : teamSize,
//         "about": about == null ? null : about,
//         "social_media": socialMedia == null ? null : socialMedia!.toJson(),
//         "city": city == null ? null : city,
//         "state": state == null ? null : state,
//         "country": country == null ? null : country,
//         "zip_code": zipCode == null ? null : zipCode,
//         "address": address == null ? null : address,
//         "slug": slug == null ? null : slug,
//         "status": status == null ? null : status,
//         "create_user": createUser == null ? null : createUser,
//         "update_user": updateUser == null ? null : updateUser,
//         "map_lat": mapLat,
//         "map_lng": mapLng,
//         "deleted_at": deletedAt,
//         "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
//         "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
//       };
// }

// class SocialMedia {
//   SocialMedia({
//     this.skype,
//     this.facebook,
//     this.twitter,
//     this.instagram,
//     this.linkedin,
//     this.google,
//   });

//   dynamic skype;
//   dynamic facebook;
//   dynamic twitter;
//   dynamic instagram;
//   dynamic linkedin;
//   dynamic google;

//   factory SocialMedia.fromJson(Map<String, dynamic> json) => SocialMedia(
//         skype: json["skype"],
//         facebook: json["facebook"],
//         twitter: json["twitter"],
//         instagram: json["instagram"],
//         linkedin: json["linkedin"],
//         google: json["google"],
//       );

//   Map<String, dynamic> toJson() => {
//         "skype": skype,
//         "facebook": facebook,
//         "twitter": twitter,
//         "instagram": instagram,
//         "linkedin": linkedin,
//         "google": google,
//       };
// }

// class JobType {
//   JobType({
//     this.id,
//     this.name,
//     this.slug,
//     this.status,
//     this.createUser,
//     this.updateUser,
//     this.deletedAt,
//     this.createdAt,
//     this.updatedAt,
//   });

//   int? id;
//   String? name;
//   dynamic slug;
//   String? status;
//   dynamic createUser;
//   dynamic updateUser;
//   dynamic deletedAt;
//   DateTime? createdAt;
//   dynamic updatedAt;

//   factory JobType.fromJson(Map<String, dynamic> json) => JobType(
//         id: json["id"] == null ? null : json["id"],
//         name: json["name"] == null ? null : json["name"],
//         slug: json["slug"],
//         status: json["status"] == null ? null : json["status"],
//         createUser: json["create_user"],
//         updateUser: json["update_user"],
//         deletedAt: json["deleted_at"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "name": name == null ? null : name,
//         "slug": slug,
//         "status": status == null ? null : status,
//         "create_user": createUser,
//         "update_user": updateUser,
//         "deleted_at": deletedAt,
//         "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
//         "updated_at": updatedAt,
//       };
// }

// class Location {
//   Location({
//     this.id,
//     this.name,
//     this.slug,
//     this.imageId,
//     this.mapLat,
//     this.mapLng,
//     this.mapZoom,
//     this.status,
//     this.lft,
//     this.rgt,
//     this.parentId,
//     this.createUser,
//     this.updateUser,
//     this.deletedAt,
//     this.originId,
//     this.lang,
//     this.createdAt,
//     this.updatedAt,
//     this.zipcode,
//   });

//   int? id;
//   String? name;
//   String? slug;
//   dynamic imageId;
//   String? mapLat;
//   String? mapLng;
//   int? mapZoom;
//   String? status;
//   int? lft;
//   int? rgt;
//   dynamic parentId;
//   int? createUser;
//   int? updateUser;
//   dynamic deletedAt;
//   dynamic originId;
//   dynamic lang;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic zipcode;

//   factory Location.fromJson(Map<String, dynamic> json) => Location(
//         id: json["id"] == null ? null : json["id"],
//         name: json["name"] == null ? null : json["name"],
//         slug: json["slug"] == null ? null : json["slug"],
//         imageId: json["image_id"],
//         mapLat: json["map_lat"] == null ? null : json["map_lat"],
//         mapLng: json["map_lng"] == null ? null : json["map_lng"],
//         mapZoom: json["map_zoom"] == null ? null : json["map_zoom"],
//         status: json["status"] == null ? null : json["status"],
//         lft: json["_lft"] == null ? null : json["_lft"],
//         rgt: json["_rgt"] == null ? null : json["_rgt"],
//         parentId: json["parent_id"],
//         createUser: json["create_user"] == null ? null : json["create_user"],
//         updateUser: json["update_user"] == null ? null : json["update_user"],
//         deletedAt: json["deleted_at"],
//         originId: json["origin_id"],
//         lang: json["lang"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         zipcode: json["zipcode"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "name": name == null ? null : name,
//         "slug": slug == null ? null : slug,
//         "image_id": imageId,
//         "map_lat": mapLat == null ? null : mapLat,
//         "map_lng": mapLng == null ? null : mapLng,
//         "map_zoom": mapZoom == null ? null : mapZoom,
//         "status": status == null ? null : status,
//         "_lft": lft == null ? null : lft,
//         "_rgt": rgt == null ? null : rgt,
//         "parent_id": parentId,
//         "create_user": createUser == null ? null : createUser,
//         "update_user": updateUser == null ? null : updateUser,
//         "deleted_at": deletedAt,
//         "origin_id": originId,
//         "lang": lang,
//         "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
//         "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
//         "zipcode": zipcode,
//       };
// }

// class User {
//   User({
//     this.id,
//     this.name,
//     this.firstName,
//     this.lastName,
//     this.email,
//     this.phone,
//     this.emailVerifiedAt,
//     this.verificationCode,
//     this.birthday,
//     this.lastLoginAt,
//     this.avatarId,
//     this.bio,
//     this.status,
//     this.createUser,
//     this.updateUser,
//     this.vendorCommissionAmount,
//     this.vendorCommissionType,
//     this.roleId,
//     this.billingLastName,
//     this.billingFirstName,
//     this.country,
//     this.state,
//     this.city,
//     this.zipCode,
//     this.address,
//     this.address2,
//     this.paymentGateway,
//     this.totalGuests,
//     this.locale,
//     this.verifySubmitStatus,
//     this.isVerified,
//     this.needUpdatePw,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//   });

//   int? id;
//   String? name;
//   String? firstName;
//   String? lastName;
//   String? email;
//   String? phone;
//   DateTime? emailVerifiedAt;
//   String? verificationCode;
//   DateTime? birthday;
//   dynamic lastLoginAt;
//   int? avatarId;
//   String? bio;
//   String? status;
//   dynamic createUser;
//   dynamic updateUser;
//   dynamic vendorCommissionAmount;
//   dynamic vendorCommissionType;
//   int? roleId;
//   dynamic billingLastName;
//   dynamic billingFirstName;
//   String? country;
//   dynamic state;
//   dynamic city;
//   dynamic zipCode;
//   String? address;
//   dynamic address2;
//   String? paymentGateway;
//   int? totalGuests;
//   String? locale;
//   String? verifySubmitStatus;
//   int? isVerified;
//   int? needUpdatePw;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic deletedAt;

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"] == null ? null : json["id"],
//         name: json["name"] == null ? null : json["name"],
//         firstName: json["first_name"] == null ? null : json["first_name"],
//         lastName: json["last_name"] == null ? null : json["last_name"],
//         email: json["email"] == null ? null : json["email"],
//         phone: json["phone"] == null ? null : json["phone"],
//         emailVerifiedAt: json["email_verified_at"] == null
//             ? null
//             : DateTime.parse(json["email_verified_at"]),
//         verificationCode: json["verification_code"] == null
//             ? null
//             : json["verification_code"],
//         birthday:
//             json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
//         lastLoginAt: json["last_login_at"],
//         avatarId: json["avatar_id"] == null ? null : json["avatar_id"],
//         bio: json["bio"] == null ? null : json["bio"],
//         status: json["status"] == null ? null : json["status"],
//         createUser: json["create_user"],
//         updateUser: json["update_user"],
//         vendorCommissionAmount: json["vendor_commission_amount"],
//         vendorCommissionType: json["vendor_commission_type"],
//         roleId: json["role_id"] == null ? null : json["role_id"],
//         billingLastName: json["billing_last_name"],
//         billingFirstName: json["billing_first_name"],
//         country: json["country"] == null ? null : json["country"],
//         state: json["state"],
//         city: json["city"],
//         zipCode: json["zip_code"],
//         address: json["address"] == null ? null : json["address"],
//         address2: json["address2"],
//         paymentGateway:
//             json["payment_gateway"] == null ? null : json["payment_gateway"],
//         totalGuests: json["total_guests"] == null ? null : json["total_guests"],
//         locale: json["locale"] == null ? null : json["locale"],
//         verifySubmitStatus: json["verify_submit_status"] == null
//             ? null
//             : json["verify_submit_status"],
//         isVerified: json["is_verified"] == null ? null : json["is_verified"],
//         needUpdatePw:
//             json["need_update_pw"] == null ? null : json["need_update_pw"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         deletedAt: json["deleted_at"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "name": name == null ? null : name,
//         "first_name": firstName == null ? null : firstName,
//         "last_name": lastName == null ? null : lastName,
//         "email": email == null ? null : email,
//         "phone": phone == null ? null : phone,
//         "email_verified_at":
//             emailVerifiedAt == null ? null : emailVerifiedAt!.toIso8601String(),
//         "verification_code": verificationCode == null ? null : verificationCode,
//         "birthday": birthday == null
//             ? null
//             : "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}",
//         "last_login_at": lastLoginAt,
//         "avatar_id": avatarId == null ? null : avatarId,
//         "bio": bio == null ? null : bio,
//         "status": status == null ? null : status,
//         "create_user": createUser,
//         "update_user": updateUser,
//         "vendor_commission_amount": vendorCommissionAmount,
//         "vendor_commission_type": vendorCommissionType,
//         "role_id": roleId == null ? null : roleId,
//         "billing_last_name": billingLastName,
//         "billing_first_name": billingFirstName,
//         "country": country == null ? null : country,
//         "state": state,
//         "city": city,
//         "zip_code": zipCode,
//         "address": address == null ? null : address,
//         "address2": address2,
//         "payment_gateway": paymentGateway == null ? null : paymentGateway,
//         "total_guests": totalGuests == null ? null : totalGuests,
//         "locale": locale == null ? null : locale,
//         "verify_submit_status":
//             verifySubmitStatus == null ? null : verifySubmitStatus,
//         "is_verified": isVerified == null ? null : isVerified,
//         "need_update_pw": needUpdatePw == null ? null : needUpdatePw,
//         "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
//         "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
//         "deleted_at": deletedAt,
//       };
// }

// class Link {
//   Link({
//     this.url,
//     this.label,
//     this.active,
//   });

//   String? url;
//   String? label;
//   bool? active;

//   factory Link.fromJson(Map<String, dynamic> json) => Link(
//         url: json["url"] == null ? null : json["url"],
//         label: json["label"] == null ? null : json["label"],
//         active: json["active"] == null ? null : json["active"],
//       );

//   Map<String, dynamic> toJson() => {
//         "url": url == null ? null : url,
//         "label": label == null ? null : label,
//         "active": active == null ? null : active,
//       };
// }

class MyJobProvider extends ChangeNotifier {
  MyJobsModel? myJobsModel;
  MyJobsModel? searchedJobs = MyJobsModel();
  // JobsModel? popularJobModel;
  // JobsModel? urgenJobModel;
  bool statusLogin = false;
  String mssgLogin = '';
  String emailToVerify = '';
  String resetTypeToVerify = '';

  RefreshController myjobRefreshController = RefreshController();

  Future intit(String token) async {
    await getMyJob(token);
  }

  Future<MyJobsModel?> getMyJob(String token) async {
    var body = await GetServices.getMyJob(token);
    if (body["status"]) {
      if (body != null) {
        var data = body["data"];
        //applicantDetail = ApplicantDetailModel.fromJson();
        myJobsModel = MyJobsModel.fromJson(body);
        notifyListeners();
        //print(jobsModel);
        return myJobsModel;
      }
      // } else {
      //   var mssg = body['message'] ?? Constants.mssgErrTryLater;

      //   if (body['message'].toString().trim().isEmpty)
      //     mssg = Constants.mssgErrTryLater;
      //   await getToastMessage(mssg, Colors.red);
      //   return false;
      // }
    }
  }

  searchJobs(String keyword) {
    searchedJobs!.data = myJobsModel!.data!
        .where((element) => element.title!.contains(keyword))
        .toList();
    notifyListeners();
  }

  Future<bool?> createUpdateJob(MyJob myJob) async {
    var body = await PostServices.createUpdateJob(myJob);

    var mssg = body['message'] ?? Constants.mssgErrTryLater;
    if (body["status"] == 1) {
      return true;
    } else if (body['message'].toString().trim().isEmpty) {
      mssg = Constants.mssgErrTryLater;
      await getToastMessage(mssg, Colors.red);
      return false;
    } else {
      await getToastMessage(mssg, Colors.red);
      return false;
    }
  }

  Future<bool?> destroyMyJob(String id, String token) async {
    var body = await PostServices.destroyMyJob(id, token);

    var mssg = body['message'] ?? Constants.mssgErrTryLater;
    if (body["status"]) {
      await getToastMessage(mssg, Colors.red);
      return true;
    } else if (body['message'].toString().trim().isEmpty) {
      mssg = Constants.mssgErrTryLater;
      await getToastMessage(mssg, Colors.red);
      return false;
    } else {
      await getToastMessage(mssg, Colors.red);
      return false;
    }
  }
}
