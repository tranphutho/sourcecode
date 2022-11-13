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

// Findjobs findjobsFromJson(String str) => Findjobs.fromJson(json.decode(str));

// String findjobsToJson(Findjobs data) => json.encode(data.toJson());

class ApplicantsModel {
  ApplicantsModel({
    this.data,
  });

  List<Applicant>? data;

  factory ApplicantsModel.fromJson(Map<String, dynamic> json) =>
      ApplicantsModel(
        data: json["data"] == null
            ? null
            : List<Applicant>.from(
                json["data"].map((x) => Applicant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<Applicant>.from(data!.map((x) => x.toJson())),
      };
}

class Applicant {
  Applicant({
    this.id,
    this.jobId,
    this.candidateId,
    this.cvId,
    this.message,
    this.status,
    this.companyId,
    this.createUser,
    this.updateUser,
    this.createdAt,
    this.updatedAt,
    this.jobInfo,
    this.candidateInfo,
    this.cvInfo,
  });

// "id": 19,
// "job_id": 11,
// "candidate_id": 170,
// "cv_id": 102,
// "message": "the",
// "status": "pending",
// "company_id": 41,
// "create_user": 170,
// "update_user": null,
// "created_at": "2022-11-05T04:29:48.000000Z",
// "updated_at": "2022-11-05T04:29:48.000000Z",
// "job_info": {
//     "id": 11,
//     "title": "PHP developer",
//     "slug": "php-developer",
//     "content": "<p>T&ocirc;i cần lập tr&igrave;nh vi&ecirc;n PHP</p>",
//     "category_id": 85,
//     "thumbnail_id": null,
//     "location_id": 10,
//     "company_id": 41,
//     "job_type_id": 2,
//     "expiration_date": "2022-11-30 00:00:00",
//     "hours": null,
//     "hours_type": null,
//     "salary_type": "monthly",
//     "salary_min": "1000.00",
//     "salary_max": "2000.00",
//     "gender": "Both",
//     "map_lat": null,
//     "map_lng": null,
//     "map_zoom": 8,
//     "experience": 2,
//     "is_featured": null,
//     "is_urgent": 1,
//     "status": "publish",
//     "deleted_at": null,
//     "create_user": 212,
//     "update_user": 212,
//     "created_at": "2022-11-03T09:40:44.000000Z",
//     "updated_at": "2022-11-03T09:41:26.000000Z",
//     "apply_type": null,
//     "apply_link": null,
//     "apply_email": null,
//     "gallery": null,
//     "video": null,
//     "video_cover_id": null,
//     "number_recruitments": 2,
//     "wage_agreement": null
// },
// "candidate_info": {
//     "id": 170,
//     "title": null,
//     "website": null,
//     "gender": null,
//     "gallery": null,
//     "video": null,
//     "allow_search": "publish",
// },
// "cv_info": {
//     "id": 102,
//     "file_id": 387,
//     "origin_id": 170,
//     "is_default": null,
//     "create_user": 170,
//     "update_user": null,
//     "created_at": "2022-11-05T04:29:48.000000Z",
//     "updated_at": "2022-11-05T04:29:48.000000Z"
// }

  int? id;
  int? jobId;
  int? candidateId;
  int? cvId;
  String? message;
  String? status;
  int? companyId;
  int? createUser;
  int? updateUser;
  DateTime? createdAt;
  DateTime? updatedAt;

  JobInfo? jobInfo;
  CandidateInfo? candidateInfo;
  CvInfo? cvInfo;
  //Company? company;

  factory Applicant.fromJson(Map<String, dynamic> json) => Applicant(
        id: json["id"] == null ? null : json["id"],
        jobId: json["job_id"] == null ? null : json["job_id"],
        candidateId: json["candidate_id"] == null ? null : json["candidate_id"],
        cvId: json["cv_id"] == null ? null : json["cv_id"],
        message: json["message"] == null ? null : json["message"],
        status: json["status"] == null ? null : json["status"],
        companyId: json["company_id"] == null ? null : json["company_id"],
        createUser: json["create_user"] == null ? null : json["create_user"],
        updateUser: json["update_user"] == null ? null : json["update_user"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        jobInfo: json["job_info"] == null
            ? null
            : JobInfo.fromJson(json["job_info"]),
        candidateInfo: json["candidate_info"] == null
            ? null
            : CandidateInfo.fromJson(json["candidate_info"]),
        cvInfo:
            json["cv_info"] == null ? null : CvInfo.fromJson(json["cv_info"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "job_id": jobId == null ? null : jobId,
        "candidate_id": candidateId == null ? null : candidateId,
        "cv_id": cvId == null ? null : cvId,
        "message": message == null ? null : message,
        "status": status == null ? null : status,
        "company_id": companyId == null ? null : companyId,
        "create_user": createUser == null ? null : createUser,
        "update_user": updateUser == null ? null : updateUser,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "job_info": jobInfo == null ? null : jobInfo!.toJson(),
        "candidate_info":
            candidateInfo == null ? null : candidateInfo!.toJson(),
        "cv_info": cvInfo == null ? null : cvInfo!.toJson(),
      };
}

class JobInfo {
  JobInfo(
      {this.id,
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
      this.wageAgreement});

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
  String? deletedAt;
  int? createUser;
  dynamic updateUser;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? applyType;
  String? applyLink;
  String? applyEmail;
  String? gallery;
  String? video;
  int? videoCoverId;
  int? numberRecruitments;
  dynamic? wageAgreement;

  factory JobInfo.fromJson(Map<String, dynamic> json) => JobInfo(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
        content: json["content"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        thumbnailId: json["thumbnail_id"] == null ? null : json["thumbnail_id"],
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
        mapLat: json["map_lat"] == null ? null : json["map_lat"],
        mapLng: json["map_lng"] == null ? null : json["map_lng"],
        mapZoom: json["map_zoom"] == null ? null : json["map_zoom"],
        experience: json["experience"] == null ? null : json["experience"],
        isFeatured: json["is_featured"] == null ? null : json["is_featured"],
        isUrgent: json["is_urgent"] == null ? null : json["is_urgent"],
        status: json["status"] == null ? null : json["status"],
        deletedAt: json["deleted_at"],
        createUser: json["create_user"] == null ? null : json["create_user"],
        updateUser: json["update_user"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        applyType: json["apply_type"] == null ? null : json["apply_type"],
        applyLink: json["apply_link"] == null ? null : json["apply_link"],
        applyEmail: json["apply_email"] == null ? null : json["apply_email"],
        gallery: json["gallery"] == null ? null : json["gallery"],
        video: json["video"] == null ? null : json["video"],
        videoCoverId:
            json["video_cover_id"] == null ? null : json["video_cover_id"],
        numberRecruitments: json["number_recruitments"] == null
            ? null
            : json["number_recruitments"],
        wageAgreement:
            json["wage_agreement"] == null ? null : json["wage_agreement"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
        "content": content,
        "category_id": categoryId == null ? null : categoryId,
        "thumbnail_id": thumbnailId == null ? null : thumbnailId,
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
        "map_lat": mapLat == null ? null : mapLat,
        "map_lng": mapLng == null ? null : mapLng,
        "map_zoom": mapZoom == null ? null : mapZoom,
        "experience": experience == null ? null : experience,
        "is_featured": isFeatured == null ? null : isFeatured,
        "is_urgent": isUrgent == null ? null : isUrgent,
        "status": status == null ? null : status,
        "deleted_at": deletedAt,
        "create_user": createUser == null ? null : createUser,
        "update_user": updateUser,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "apply_type": applyType == null ? null : applyType,
        "apply_link": applyLink == null ? null : applyLink,
        "apply_email": applyEmail == null ? null : applyEmail,
        "gallery": gallery == null ? null : gallery,
        "video": video == null ? null : video,
        "video_cover_id": videoCoverId == null ? null : videoCoverId,
        "number_recruitments":
            numberRecruitments == null ? null : numberRecruitments,
        "wage_agreement": wageAgreement == null ? null : wageAgreement,
      };
}

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
//             : CandidateInfo.fromJson(json["candidate_info"]),
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

class CandidateInfo {
  CandidateInfo({
    this.id,
    this.title,
    this.website,
    this.gender,
    this.gallry,
    this.video,
    this.allowSearch,
  });
  int? id;
  String? title;
  String? website;
  String? gender;
  String? gallry;
  String? video;
  String? allowSearch;

  factory CandidateInfo.fromJson(Map<String, dynamic> json) => CandidateInfo(
        id: json["id"],
        title: json["title"],
        website: json["website"],
        gender: json["gender"],
        gallry: json["gallry"],
        video: json["video"],
        allowSearch: json["allow_search"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "website": website,
        "gender": gender,
        "gallry": gallry,
        "video": video,
        "allow_search": allowSearch,
      };
}

class CvInfo {
  CvInfo({
    this.id,
    this.fileId,
    this.originId,
    this.isDefault,
    this.createUser,
    this.updateUser,
    this.createdAt,
    this.updatedAt,
    this.media,
  });

  int? id;
  int? fileId;
  int? originId;
  dynamic? isDefault;
  dynamic createUser;
  dynamic updateUser;
  DateTime? createdAt;
  dynamic updatedAt;
  Media? media;

  factory CvInfo.fromJson(Map<String, dynamic> json) => CvInfo(
        id: json["id"] == null ? null : json["id"],
        fileId: json["file_id"] == null ? null : json["file_id"],
        originId: json["origin_id"] == null ? null : json["origin_id"],
        isDefault: json["is_default"] == null ? null : json["is_default"],
        createUser: json["create_user"],
        updateUser: json["update_user"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        media: json["media"] == null ? null : Media.fromJson(json["media"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "file_id": fileId == null ? null : fileId,
        "origin_id": originId == null ? null : originId,
        "is_default": isDefault == null ? null : isDefault,
        "create_user": createUser,
        "update_user": updateUser,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "media": media == null ? null : media!.toJson(),
      };
}

class Media {
  int? id;
  String? fileName;
  String? filePath;
  String? fileSize;
  String? fileType;
  String? fileExtension;
  int? createUser;
  int? updateUser;
  DateTime? deletedAt;
  int? appId;
  int? appUserId;
  int? fileWidth;
  int? fileHeight;
  DateTime? createdAt;
  DateTime? updatedAt;

  Media(
      {this.id,
      this.fileName,
      this.filePath,
      this.fileSize,
      this.fileType,
      this.fileExtension,
      this.createUser,
      this.updateUser,
      this.deletedAt,
      this.appId,
      this.appUserId,
      this.fileWidth,
      this.fileHeight,
      this.createdAt,
      this.updatedAt});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'] == null ? null : json['id'];
    fileName = json['file_name'] == null ? null : json['file_name'];
    filePath = json['file_path'] == null ? null : json['file_path'];
    fileSize = json['file_size'] == null ? null : json['file_size'];
    fileType = json['file_type'] == null ? null : json['file_type'];
    fileExtension =
        json['file_extension'] == null ? null : json['file_extension'];
    createUser = json['create_user'] == null ? null : json['create_user'];
    updateUser = json['update_user'] == null ? null : json['update_user'];
    deletedAt =
        json['deleted_at'] == null ? null : DateTime.parse(json['deleted_at']);
    appId = json['app_id'] == null ? null : json['app_id'];
    appUserId = json['app_user_id'] == null ? null : json['app_user_id'];
    fileWidth = json['file_width'] == null ? null : json['file_width'];
    fileHeight = json['file_height'] == null ? null : json['file_height'];
    createdAt =
        json['created_at'] == null ? null : DateTime.parse(json['created_at']);
    updatedAt =
        json['updated_at'] == null ? null : DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() => {
        'id': this.id == null ? null : this.id,
        'file_name': this.fileName == null ? null : this.fileName,
        'file_path': this.filePath == null ? null : this.filePath,
        'file_size': this.fileSize == null ? null : this.fileSize,
        'file_type': this.fileType == null ? null : this.fileType,
        'file_extension':
            this.fileExtension == null ? null : this.fileExtension,
        'create_user': this.createUser == null ? null : this.createUser,
        'update_user': this.updateUser == null ? null : this.updateUser,
        'deleted_at':
            this.deletedAt == null ? null : deletedAt!.toIso8601String(),
        'app_id': this.appId == null ? null : this.appId,
        'app_user_id': this.appUserId == null ? null : this.appUserId,
        'file_width': this.fileWidth == null ? null : this.fileWidth,
        'file_height': this.fileHeight == null ? null : this.fileHeight,
        'created_at':
            this.createdAt == null ? null : this.createdAt!.toIso8601String(),
        'updated_at':
            this.updatedAt == null ? null : this.updatedAt!.toIso8601String(),
      };
}

class ApplicantsProvider extends ChangeNotifier {
  ApplicantsModel? applicantsModel;

  bool statusLogin = false;
  String mssgLogin = '';
  String emailToVerify = '';
  String resetTypeToVerify = '';

  RefreshController jobRefreshController = RefreshController();

  Future intit(String token) async {
    await getApplicants(token);
  }

  Future<ApplicantsModel?> getApplicants(String token) async {
    var body = await GetServices.getApplicants(token);
    if (body["status"]) {
      if (body != null) {
        var data = body["data"];
        //applicantDetail = ApplicantDetailModel.fromJson();
        applicantsModel = ApplicantsModel.fromJson(data);
        notifyListeners();
        //print(jobsModel);
        return applicantsModel;
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

  Future<bool?> applyJob(File file, String path, String fileName,
      String message, String id_job, String id_company, String token) async {
    var body = await PostServices.applyJob(
        file, path, fileName, message, id_job, id_company, token);

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
}
