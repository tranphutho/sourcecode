// To parse this JSON data, do
//
//     final findjobs = findjobsFromJson(jsonString);

import 'package:flutter/material.dart';
import 'package:hires/models/user_model.dart';
import 'package:hires/services/get_services.dart';

import '../services/post_services.dart';
import 'job_model.dart';

// Findjobs findjobsFromJson(String str) => Findjobs.fromJson(json.decode(str));

// String findjobsToJson(Findjobs data) => json.encode(data.toJson());

class JobsModel {
  JobsModel({
    this.id,
    this.title,
    this.slug,
    this.content,
    this.expirationDate,
    this.hours,
    this.salaryType,
    this.salaryMin,
    this.salaryMax,
    this.gender,
    this.isUrgent
  });
  int? id;
  String? title;
  String? slug;
  String? content;
  String? expirationDate;
  var hours;
  String? salaryType;
  var salaryMin;
  var salaryMax;
  String? gender;
  int? isUrgent;
  int? isFeatured;



  JobsModel.fromJson(Map<String, dynamic> map) {
    id = map["id"];
    title = map["title"];
    slug = map["slug"];
    content = map["content"];
    expirationDate = map["expiration_date"];
    hours = map["hours"];
    salaryType = map["salary_type"];
    salaryMin = map["salary_min"];
    salaryMax = map["salary_max"];
    gender = map["gender"];
    isUrgent = map["is_urgent"];
    isFeatured = map["is_featured"];

  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'slug': slug,
    'content': content,
    'expiration_date': expirationDate,
    'hours': hours,
    'salary_type': salaryType,
    'salary_min': salaryMin,
    'salary_max': salaryMax,
    'gender': gender,
    'is_urgent': isUrgent,
    'is_featured': isFeatured,

  };

}

class EmployersModel {
  EmployersModel({
    this.data,
  });

  List<Employer>? data;

  factory EmployersModel.fromJson(Map<String, dynamic> json) => EmployersModel(
    data: json["data"] == null
        ? null
        : List<Employer>.from(
        json["data"].map((x) => Employer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null
        ? null
        : List<Employer>.from(data!.map((x) => x.toJson())),
  };
}

class Employer {
  Employer({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.website,
    this.avatarId,
    this.coverId,
    this.foundedIn,
    this.allowSearch,
    this.isFeatured,
    this.ownerId,
    this.locationId,
    this.categoryId,
    this.teamSize,
    this.about,
    this.category,
    this.company,
    this.location,
    this.jobCount,
    this.jobs,
  });

  int? id;
  String? name;
  String? email;
  String? phone;
  String? website;
  int? avatarId;
  int? coverId;
  String? foundedIn;
  int? allowSearch;
  int? isFeatured;
  int? ownerId;
  int? locationId;
  int? categoryId;
  int? teamSize;
  String? about;
  Category? category;
  Company? company;
  Location? location;
  int? jobCount;
  List<JobsModel>? jobs;

  factory Employer.fromJson(Map<String, dynamic> json) => Employer(
    id: json['id'] == null ? null : json['id'],
    name: json['name'] == null ? null : json['name'],
    email: json['email'] == null ? null : json['email'],
    phone: json['phone'] == null ? null : json['phone'],
    website: json['website'] == null ? null : json['website'],
    // avatarId: json['avatar_id'] == null ? null : json['avatar_id'],
    // coverId: json['cover_id'] == null ? null : json['cover_id'],
    foundedIn: json['founded_in'] == null ? null : json['founded_id'],
    allowSearch: json['allow_search'] == null ? null : json['allow_search'],
    isFeatured: json['is_featured'] == null ? null : json['is_featured'],
    ownerId: json['owner_id'] == null ? null : json['owner_id'],
    locationId: json['location_id'] == null ? null : json['location_id'],
    categoryId: json['category_id'] == null ? null : json['category_id'],
    teamSize: json['team_size'] == null ? null : json['team_size'],
    about: json['about'] == null ? null : json['about'],
    company:json['company']!=null? Company.fromJson(json['company']):null,
    category: json["category"] == null
        ? null
        : Category.fromJson(json["category"]),
    location: json["location"] == null
        ? null
        : Location.fromJson(json["location"]),
    jobCount: json["job_count"] == null ? null : json["job_count"],
    jobs: json["jobs"] == null
        ? null
        : List<JobsModel>.from(
            json["jobs"].map((x) => JobsModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'id': this.id == null ? null : this.id,
    'name': this.name == null ? null : this.name,
    'email': this.email == null ? null : this.email,
    'phone': this.phone == null ? null : this.phone,
    'website': this.website == null ? null : this.website,
    // 'avatar_id': this.avatarId == null ? null : this.avatarId,
    // 'cover_id': this.coverId == null ? null : this.coverId,
    'founded_in': this.foundedIn == null ? null : this.foundedIn,
    'allow_search': this.allowSearch == null ? null : this.allowSearch,
    'is_featured': this.isFeatured == null ? null : this.isFeatured,
    'owner_id': this.ownerId == null ? null : this.ownerId,
    'location_id': this.locationId == null ? null : this.locationId,
    'category_id': this.categoryId == null ? null : this.categoryId,
    'team_size': this.teamSize == null ? null : this.teamSize,
    'about': this.about == null ? null : this.about,
    'category': category == null ? null : category!.toJson(),
    'location': location == null ? null : location!.toJson(),
    'job_count': this.jobCount == null ? null : this.jobCount,
    "jobs": jobs == null
        ? null
        : List<JobsModel>.from(jobs!.map((x) => x.toJson())),
  };
}

class EmployersProvider extends ChangeNotifier {
  EmployersModel? employersModel;
  EmployersModel? followingEmployers;

  Future init({String? keyword}) async {
    await getEmployer(keyword: keyword);
  }

  Future<EmployersModel?> getEmployer({String? keyword}) async {
    var body = await GetServices.getEmployers(keyword: keyword);
    print(body.toString());
    if (body["status"]) {
      if (body != null) {
        var data = body["data"];
        employersModel = EmployersModel.fromJson(data);
        notifyListeners();
        return employersModel;
      }
    }
  }
  Future<EmployersModel?> getFollowingEmployers({String? token}) async {
    var body = await GetServices.getFollowingEmployers(token!);
    print(body.toString());
    if (body["status"]) {
      if (body != null) {
        var data = body["data"];
        followingEmployers = EmployersModel.fromJson(data);
        notifyListeners();
        return followingEmployers;
      }
    }
  }
}
