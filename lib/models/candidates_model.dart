// To parse this JSON data, do
//
//     final findjobs = findjobsFromJson(jsonString);

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hires/core/constants/constants.dart';
import 'package:hires/core/utils/common_utils.dart';
import 'package:hires/models/applicant_detail_model.dart';
import 'package:hires/services/get_services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../services/post_services.dart';
import 'job_model.dart';

// Findjobs findjobsFromJson(String str) => Findjobs.fromJson(json.decode(str));

// String findjobsToJson(Findjobs data) => json.encode(data.toJson());

class CadidatesModel {
  CadidatesModel({
    this.data,
  });

  List<Cadidate>? data;

  factory CadidatesModel.fromJson(Map<String, dynamic> json) => CadidatesModel(
        data: json["data"] == null
            ? null
            : List<Cadidate>.from(
                json["data"].map((x) => Cadidate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<Cadidate>.from(data!.map((x) => x.toJson())),
      };
}

class Cadidate {
  Cadidate({
    this.id,
    this.title,
    this.website,
    this.gender,
    this.gallery,
    this.video,
    this.allowSearch,
    this.education,
    // this.experience,
    // this.award,
    this.socialMedia,
    this.languages,
    this.educationLevel,
    this.experienceYear,
    this.expectedSalary,
    this.salaryType,
    this.locationId,
    this.mapLat,
    this.mapLng,
    this.mapZoom,
    this.city,
    this.country,
    this.address,
    this.createUser,
    this.updateUser,
    this.slug,
    this.deletedAt,
    this.originId,
    this.lang,
    this.createdAt,
    this.updatedAt,
    this.videoCoverId,
    // this.translations,
    // this.wishlist,
    this.user,
    // this.categories
  });

// "id": 170,
// "title": null,
// "website": null,
// "gender": null,
// "gallery": null,
// "video": null,
// "allow_search": "publish",
// "education": [
//     {
//         "from": "2008",
//         "to": "2010",
//         "location": "Biratnagar",
//         "reward": "test",
//         "information": "test"
//     }
// ],
// "experience": null,
// "award": null,
// "social_media": {
//     "skype": null,
//     "facebook": null,
//     "twitter": null,
//     "instagram": null,
//     "pinterest": null,
//     "dribbble": null,
//     "google": null,
//     "linkedin": null
// },
// "languages": null,
// "education_level": null,
// "experience_year": null,
// "expected_salary": null,
// "salary_type": "hourly",
// "location_id": 10,
// "map_lat": "28.987901716795704",
// "map_lng": "77.6015170755229",
// "map_zoom": 8,
// "city": null,
// "country": null,
// "address": null,
// "create_user": 170,
// "update_user": 170,
// "slug": "1",
// "deleted_at": null,
// "origin_id": null,
// "lang": null,
// "created_at": null,
// "updated_at": "2022-11-04T09:00:50.000000Z",
// "video_cover_id": null,
// "translations": [],
// "wishlist": null,
// "user": {
//     "id": 170,
//     "name": "Rajeev Majhi",
//     "first_name": "Rajeev",
//     "last_name": "Majhi",
//     "email": "rajeevkumarmajhi@gmail.com",
//     "phone": "9800930444",
//     "email_verified_at": null,
//     "verification_code": "8357221",
//     "birthday": "1992-01-27",
//     "last_login_at": null,
//     "avatar_id": null,
//     "bio": "This is test account",
//     "status": "publish",
//     "create_user": null,
//     "update_user": null,
//     "vendor_commission_amount": null,
//     "vendor_commission_type": null,
//     "role_id": 3,
//     "billing_last_name": null,
//     "billing_first_name": null,
//     "country": null,
//     "state": null,
//     "city": null,
//     "zip_code": null,
//     "address": null,
//     "address2": null,
//     "payment_gateway": "",
//     "total_guests": 0,
//     "locale": "",
//     "verify_submit_status": "",
//     "is_verified": 1,
//     "profile_updated": 1,
//     "profile_picture": "/storage/app/public/uploads/avatars/1667558683_226368043_1153908392022769_7772904387830694055_n.jpg",
//     "need_update_pw": 0,
//     "created_at": "2022-10-31T05:43:45.000000Z",
//     "updated_at": "2022-11-04T10:44:43.000000Z",
//     "deleted_at": null
// },
// "categories": []

  int? id;
  String? title;
  String? website;
  String? gender;
  String? gallery;
  String? video;
  String? allowSearch;
  List<EducationModel>? education;
  //Null? experience;
  //Null? award;
  SocialMedia? socialMedia;
  String? languages;
  String? educationLevel;
  String? experienceYear;
  String? expectedSalary;
  String? salaryType;
  int? locationId;
  String? mapLat;
  String? mapLng;
  int? mapZoom;
  String? city;
  String? country;
  String? address;
  int? createUser;
  int? updateUser;
  String? slug;
  DateTime? deletedAt;
  int? originId;
  String? lang;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? videoCoverId;
  // List<Null>? translations;
  //Null? wishlist;
  User? user;
  //List<Null>? categories;

  factory Cadidate.fromJson(Map<String, dynamic> json) => Cadidate(
        id: json['id'] == null ? null : json['id'],
        title: json['title'] == null ? null : json['title'],
        website: json['website'] == null ? null : json['website'],
        gender: json['gender'] == null ? null : json['gender'],
        gallery: json['gallery'],
        video: json['video'],
        allowSearch: json['allow_search'],
        education: json['education'] == null
            ? null
            : List<EducationModel>.from(
                json['education'].map((e) => EducationModel.fromJson(e))),
        // experience: json['experience'],
        // award : json['award'],
        socialMedia: json['social_media'] != null
            ? new SocialMedia.fromJson(json['social_media'])
            : null,
        languages: json['languages'] == null ? null : json['languages'],
        educationLevel:
            json['education_level'] == null ? null : json['education_level'],
        experienceYear:
            json['experience_year'] == null ? null : json['experience_year'],
        expectedSalary:
            json['expected_salary'] == null ? null : json['expected_salary'],
        salaryType: json['salary_type'] == null ? null : json['salary_type'],
        locationId: json['location_id'] == null ? null : json['location_id'],
        mapLat: json['map_lat'] == null ? null : json['map_lat'],
        mapLng: json['map_lng'] == null ? null : json['map_lng'],
        mapZoom: json['map_zoom'] == null ? null : json['map_zoom'],
        city: json['city'] == null ? null : json['city'],
        country: json['country'] == null ? null : json['country'],
        address: json['address'] == null ? null : json['address'],
        createUser: json['create_user'] == null ? null : json['create_user'],
        updateUser: json['update_user'] == null ? null : json['update_user'],
        slug: json['slug'] == null ? null : json['slug'],
        deletedAt: json['deleted_at'] == null
            ? null
            : DateTime.parse(json['deleted_at']),
        originId: json['origin_id'] == null ? null : json['origin_id'],
        lang: json['lang'] == null ? null : json['lang'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
        videoCoverId:
            json['video_cover_id'] == null ? null : json['video_cover_id'],
        // if (json['translations'] != null) {
        //   translations = <Null>[];
        //   json['translations'].forEach((v) {
        //     translations!.add(new Null.fromJson(v));
        //   });
        // }
        // wishlist :json['wishlist']==null?null:json['wishlist'],
        user: json['user'] == null ? null : new User.fromJson(json['user']),
        // if (json['categories'] != null) {
        //   categories = <Null>[];
        // json['categories'].forEach((v) {
        //   categories!.add(new Null.fromJson(v));
        // });
      );

  Map<String, dynamic> toJson() => {
        'id': this.id == null ? null : this.id,
        'title': this.title == null ? null : this.title,
        'website': this.website == null ? null : this.website,
        'gender': this.gender == null ? null : this.gender,
        'gallery': this.gallery == null ? null : this.gender,
        'video': this.video == null ? null : this.video,
        'allow_search': this.allowSearch == null ? null : this.allowSearch,

        //'education' : this.education==null? null:this.education!.map((v) => v.toJson()).toList(),
        'education': this.education == null
            ? null
            : List<EducationModel>.from(education!.map((e) => e.toJson())),
        //'experience': this.experience;
        // 'award'] = this.award;
        // if (this.socialMedia != null) {
        //   'social_media'] = this.socialMedia!.toJson();
        // }
        'socialmedia':
            this.socialMedia == null ? null : this.socialMedia!.toJson(),
        'languages': this.languages == null ? null : this.languages,
        'education_level':
            this.educationLevel == null ? null : this.educationLevel,
        'experience_year':
            this.experienceYear == null ? null : this.experienceYear,
        'expected_salary':
            this.expectedSalary == null ? null : this.expectedSalary,
        'salary_type': this.salaryType == null ? null : this.salaryType,
        'location_id': this.locationId == null ? null : this.locationId,
        'map_lat': this.mapLat == null ? null : this.mapLat,
        'map_lng': this.mapLng == null ? null : this.mapLng,
        'map_zoom': this.mapZoom == null ? null : this.mapZoom,
        'city': this.city == null ? null : this.city,
        'country': this.country == null ? null : this.country,
        'address': this.address == null ? null : this.address,
        'create_user': this.createUser == null ? null : this.createUser,
        'update_user': this.updateUser == null ? null : this.updateUser,
        'slug': this.slug != null ? null : this.slug,
        'deleted_at':
            this.deletedAt == null ? null : this.deletedAt!.toIso8601String(),
        'origin_id': this.originId == null ? null : this.originId,
        'lang': this.lang == null ? null : this.lang,
        'created_at':
            this.createdAt == null ? null : this.createdAt!.toIso8601String(),
        'updated_at':
            this.updatedAt == null ? null : this.updatedAt!.toIso8601String(),
        'video_cover_id': this.videoCoverId == null ? null : this.videoCoverId,
        // if (this.translations != null) {
        //   'translations'] = this.translations!.map((v) => v.toJson()).toList();
        // }
        // 'wishlist'] = this.wishlist;
        // if (this.user != null) {
        //   'user'] = this.user!.toJson();
        // }
        'user': this.user == null ? null : this.user!.toJson(),
        // if (this.categories != null) {
        //   'categories'] = this.categories!.map((v) => v.toJson()).toList();
        // }
      };
}

class CadidatesProvider extends ChangeNotifier {
  CadidatesModel? cadidateModel;

  bool statusLogin = false;
  String mssgLogin = '';
  String emailToVerify = '';
  String resetTypeToVerify = '';

  RefreshController jobRefreshController = RefreshController();

  Future intit() async {
    await getCandidate();
  }

  Future intitCategories() async {}

  Future<CadidatesModel?> getCandidate() async {
    var body = await GetServices.getFeaturedJobs();
    print(body.toString());
    if (body["status"]) {
      if (body != null) {
        var data = body["data"];
        //applicantDetail = ApplicantDetailModel.fromJson();
        cadidateModel = CadidatesModel.fromJson(data);
        notifyListeners();
        //print(jobsModel);
        return cadidateModel;
      }
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
