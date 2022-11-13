import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hires/core/constants/constants.dart';
import 'package:hires/models/job_model.dart';
import 'package:hires/services/get_services.dart';

import '../core/utils/common_utils.dart';

class ResourceModel {
  bool? status;
  List<Locations>? locations;
  List<JobTypes>? jobTypes;
  List<Categories>? categories;
  List<Companies>? companies;
  List<Skills>? skills;
  List<Terms>? terms;

  ResourceModel(
      {this.status,
      this.locations,
      this.jobTypes,
      this.categories,
      this.companies,
      this.skills,
      this.terms});

  ResourceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['locations'] != null) {
      locations = <Locations>[];
      json['locations'].forEach((v) {
        locations!.add(new Locations.fromJson(v));
      });
    }
    if (json['jobTypes'] != null) {
      jobTypes = <JobTypes>[];
      json['jobTypes'].forEach((v) {
        jobTypes!.add(new JobTypes.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['companies'] != null) {
      companies = <Companies>[];
      json['companies'].forEach((v) {
        companies!.add(new Companies.fromJson(v));
      });
    }
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(new Skills.fromJson(v));
      });
    }
    if (json['terms'] != null) {
      terms = <Terms>[];
      json['terms'].forEach((v) {
        terms!.add(new Terms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.locations != null) {
      data['locations'] = this.locations!.map((v) => v.toJson()).toList();
    }
    if (this.jobTypes != null) {
      data['jobTypes'] = this.jobTypes!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.companies != null) {
      data['companies'] = this.companies!.map((v) => v.toJson()).toList();
    }
    if (this.skills != null) {
      data['skills'] = this.skills!.map((v) => v.toJson()).toList();
    }
    if (this.terms != null) {
      data['terms'] = this.terms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Locations {
  int? id;
  String? name;
  String? slug;
  int? imageId;
  String? mapLat;
  String? mapLng;
  int? mapZoom;
  String? status;
  int? iLft;
  int? iRgt;
  int? parentId;
  int? createUser;
  int? updateUser;
  DateTime? deletedAt;
  int? originId;
  String? lang;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? zipcode;

  Locations(
      {this.id,
      this.name,
      this.slug,
      this.imageId,
      this.mapLat,
      this.mapLng,
      this.mapZoom,
      this.status,
      this.iLft,
      this.iRgt,
      this.parentId,
      this.createUser,
      this.updateUser,
      this.deletedAt,
      this.originId,
      this.lang,
      this.createdAt,
      this.updatedAt,
      this.zipcode});

  Locations.fromJson(Map<String, dynamic> json) {
    id = json['id'] == null ? null : json['id'];
    name = json['name'] == null ? null : json['name'];
    slug = json['slug'] == null ? null : json['slug'];
    imageId = json['image_id'] == null ? null : json['image_id'];
    mapLat = json['map_lat'] == null ? null : json['map_lat'];
    mapLng = json['map_lng'] == null ? null : json['map_lng'];
    mapZoom = json['map_zoom'] == null ? null : json['map_zoom'];
    status = json['status'] == null ? null : json['status'];
    iLft = json['_lft'] == null ? null : json['_lft'];
    iRgt = json['_rgt'] == null ? null : json['_rgt'];
    parentId = json['parent_id'] == null ? null : json['parent_id'];
    createUser = json['create_user'] == null ? null : json['create_user'];
    updateUser = json['update_user'] == null ? null : json['update_user'];
    deletedAt =
        json['deleted_at'] == null ? null : DateTime.parse(json['deleted_at']);
    originId = json['origin_id'] == null ? null : json['origin_id'];
    lang = json['lang'] == null ? null : json['lang'];
    createdAt =
        json['created_at'] == null ? null : DateTime.parse(json['created_at']);
    updatedAt =
        json['updated_at'] == null ? null : DateTime.parse(json['updated_at']);
    zipcode = json['zipcode'] == null ? null : json['zipcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id == null ? null : this.id;
    data['name'] = name == null ? null : this.name;
    data['slug'] = slug == null ? null : this.slug;
    data['image_id'] = imageId == null ? null : this.imageId;
    data['map_lat'] = mapLat == null ? null : this.mapLat;
    data['map_lng'] = mapLng == null ? null : this.mapLng;
    data['map_zoom'] = mapZoom == null ? null : this.mapZoom;
    data['status'] = status == null ? null : this.status;
    data['_lft'] = iLft == null ? null : this.iLft;
    data['_rgt'] = iRgt == null ? null : this.iRgt;
    data['parent_id'] = parentId == null ? null : this.parentId;
    data['create_user'] = createUser == null ? null : this.createUser;
    data['update_user'] = updateUser == null ? null : this.updateUser;
    data['deleted_at'] =
        deletedAt == null ? null : this.deletedAt!.toIso8601String();
    data['origin_id'] = this.originId == null ? null : this.originId;
    data['lang'] = lang == null ? null : this.lang;
    data['created_at'] =
        createdAt == null ? null : this.createdAt!.toIso8601String();
    data['updated_at'] =
        updatedAt == null ? null : this.updatedAt!.toIso8601String();
    data['zipcode'] = zipcode == null ? null : this.zipcode;
    return data;
  }
}

class JobTypes {
  int? id;
  String? name;
  String? slug;
  String? status;
  int? createUser;
  int? updateUser;
  DateTime? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  JobTypes(
      {this.id,
      this.name,
      this.slug,
      this.status,
      this.createUser,
      this.updateUser,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  JobTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    status = json['status'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    deletedAt =
        json['deleted_at'] == null ? null : DateTime.parse(json['deleted_at']);
    createdAt =
        json['created_at'] == null ? null : DateTime.parse(json['created_at']);
    updatedAt =
        json['updated_at'] == null ? null : DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['create_user'] = this.createUser;
    data['update_user'] = this.updateUser;
    data['deleted_at'] =
        this.deletedAt == null ? null : this.deletedAt!.toIso8601String();
    data['created_at'] =
        this.createdAt == null ? null : this.createdAt!.toIso8601String();
    data['updated_at'] =
        this.updatedAt == null ? null : this.updatedAt!.toIso8601String();
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? content;
  String? slug;
  String? status;
  int? originId;
  String? icon;
  String? lang;
  int? iLft;
  int? iRgt;
  int? parentId;
  int? createUser;
  int? updateUser;
  DateTime? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Categories(
      {this.id,
      this.name,
      this.content,
      this.slug,
      this.status,
      this.originId,
      this.icon,
      this.lang,
      this.iLft,
      this.iRgt,
      this.parentId,
      this.createUser,
      this.updateUser,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    content = json['content'];
    slug = json['slug'];
    status = json['status'];
    originId = json['origin_id'];
    icon = json['icon'];
    lang = json['lang'];
    iLft = json['_lft'];
    iRgt = json['_rgt'];
    parentId = json['parent_id'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    deletedAt =
        json['deleted_at'] == null ? null : DateTime.parse(json['deleted_at']);
    createdAt =
        json['created_at'] == null ? null : DateTime.parse(json['created_at']);
    updatedAt =
        json['updated_at'] == null ? null : DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['content'] = this.content;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['origin_id'] = this.originId;
    data['icon'] = this.icon;
    data['lang'] = this.lang;
    data['_lft'] = this.iLft;
    data['_rgt'] = this.iRgt;
    data['parent_id'] = this.parentId;
    data['create_user'] = this.createUser;
    data['update_user'] = this.updateUser;
    data['deleted_at'] =
        this.deletedAt == null ? null : this.deletedAt!.toIso8601String();
    data['created_at'] =
        this.createdAt == null ? null : this.createdAt!.toIso8601String();
    data['updated_at'] =
        this.updatedAt == null ? null : this.updatedAt!.toIso8601String();
    return data;
  }
}

class Companies {
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
  SocialMedia? socialMedia;
  String? city;
  String? state;
  String? country;
  int? zipCode;
  String? address;
  String? slug;
  String? status;
  int? createUser;
  int? updateUser;
  String? mapLat;
  String? mapLng;
  DateTime? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Companies(
      {this.id,
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
      this.socialMedia,
      this.city,
      this.state,
      this.country,
      this.zipCode,
      this.address,
      this.slug,
      this.status,
      this.createUser,
      this.updateUser,
      this.mapLat,
      this.mapLng,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Companies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    website = json['website'];
    avatarId = json['avatar_id'];
    coverId = json['cover_id'];
    foundedIn = json['founded_in'];
    allowSearch = json['allow_search'];
    isFeatured = json['is_featured'];
    ownerId = json['owner_id'];
    locationId = json['location_id'];
    categoryId = json['category_id'];
    teamSize = json['team_size'];
    about = json['about'];
    socialMedia = json['social_media'] != null
        ? new SocialMedia.fromJson(json['social_media'])
        : null;
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zipCode = json['zip_code'];
    address = json['address'];
    slug = json['slug'];
    status = json['status'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    mapLat = json['map_lat'];
    mapLng = json['map_lng'];
    deletedAt =
        json['deleted_at'] == null ? null : DateTime.parse(json['deleted_at']);
    createdAt =
        json['created_at'] == null ? null : DateTime.parse(json['created_at']);
    updatedAt =
        json['updated_at'] == null ? null : DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['website'] = this.website;
    data['avatar_id'] = this.avatarId;
    data['cover_id'] = this.coverId;
    data['founded_in'] = this.foundedIn;
    data['allow_search'] = this.allowSearch;
    data['is_featured'] = this.isFeatured;
    data['owner_id'] = this.ownerId;
    data['location_id'] = this.locationId;
    data['category_id'] = this.categoryId;
    data['team_size'] = this.teamSize;
    data['about'] = this.about;
    if (this.socialMedia != null) {
      data['social_media'] = this.socialMedia!.toJson();
    }
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['zip_code'] = this.zipCode;
    data['address'] = this.address;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['create_user'] = this.createUser;
    data['update_user'] = this.updateUser;
    data['map_lat'] = this.mapLat;
    data['map_lng'] = this.mapLng;
    data['deleted_at'] =
        this.deletedAt == null ? null : this.deletedAt!.toIso8601String();
    data['created_at'] =
        this.createdAt == null ? null : this.createdAt!.toIso8601String();
    data['updated_at'] =
        this.updatedAt == null ? null : this.updatedAt!.toIso8601String();
    return data;
  }
}

class Skills {
  int? id;
  String? name;
  String? slug;
  String? status;
  int? createUser;
  int? updateUser;
  DateTime? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Skills(
      {this.id,
      this.name,
      this.slug,
      this.status,
      this.createUser,
      this.updateUser,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Skills.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    status = json['status'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    deletedAt =
        json['deleted_at'] == null ? null : DateTime.parse(json['deleted_at']);
    createdAt =
        json['created_at'] == null ? null : DateTime.parse(json['created_at']);
    updatedAt =
        json['updated_at'] == null ? null : DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['create_user'] = this.createUser;
    data['update_user'] = this.updateUser;
    data['deleted_at'] =
        this.deletedAt == null ? null : this.deletedAt!.toIso8601String();
    data['created_at'] =
        this.createdAt == null ? null : this.createdAt!.toIso8601String();
    data['updated_at'] =
        this.updatedAt == null ? null : this.updatedAt!.toIso8601String();
    return data;
  }
}

class Terms {
  int? id;
  String? name;
  String? content;
  int? attrId;
  String? slug;
  int? createUser;
  int? updateUser;
  int? originId;
  String? lang;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? icon;
  DateTime? deletedAt;
  int? imageId;

  Terms(
      {this.id,
      this.name,
      this.content,
      this.attrId,
      this.slug,
      this.createUser,
      this.updateUser,
      this.originId,
      this.lang,
      this.createdAt,
      this.updatedAt,
      this.icon,
      this.deletedAt,
      this.imageId});

  Terms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    content = json['content'];
    attrId = json['attr_id'];
    slug = json['slug'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    originId = json['origin_id'];
    lang = json['lang'];
    icon = json['icon'];

    deletedAt =
        json['deleted_at'] == null ? null : DateTime.parse(json['deleted_at']);
    createdAt =
        json['created_at'] == null ? null : DateTime.parse(json['created_at']);
    updatedAt =
        json['updated_at'] == null ? null : DateTime.parse(json['updated_at']);
    imageId = json['image_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['content'] = this.content;
    data['attr_id'] = this.attrId;
    data['slug'] = this.slug;
    data['create_user'] = this.createUser;
    data['update_user'] = this.updateUser;
    data['origin_id'] = this.originId;
    data['lang'] = this.lang;

    data['icon'] = this.icon;

    data['deleted_at'] =
        this.deletedAt == null ? null : this.deletedAt!.toIso8601String();
    data['created_at'] =
        this.createdAt == null ? null : this.createdAt!.toIso8601String();
    data['updated_at'] =
        this.updatedAt == null ? null : this.updatedAt!.toIso8601String();
    data['image_id'] = this.imageId;
    return data;
  }
}

class ResourceModelProvider extends ChangeNotifier {
  ResourceModel? resourceModel;
  Map? countries;
  bool statusLogin = false;
  String mssgLogin = '';

  Future init() async {
    await getCountries();
    await getResource();
  }

  Future getResource() async {
    dynamic body = await GetServices.getResource();
    if (body['status']) {
      var data = body["data"];
      resourceModel = ResourceModel.fromJson(body);
    } else {
      mssgLogin = body['message'] ?? Constants.mssgErrTryLater;
      if (body['message'].toString().trim().isEmpty)
        mssgLogin = Constants.mssgErrTryLater;
      // if (mssgLogin == Constants.mssgErrVerifyEmail) emailToVerify = loginId;
      await getToastMessage(mssgLogin, Colors.red);
    }
    notifyListeners();
  }

  Future getCountries() async {
    dynamic body = await GetServices.getCountries();
    if (body['status']) {
      countries = body["data"] as Map;
      // resourceModel = ResourceModel.fromJson(body);
    } else {
      mssgLogin = body['message'] ?? Constants.mssgErrTryLater;
      if (body['message'].toString().trim().isEmpty)
        mssgLogin = Constants.mssgErrTryLater;
      // if (mssgLogin == Constants.mssgErrVerifyEmail) emailToVerify = loginId;
      await getToastMessage(mssgLogin, Colors.red);
    }
    notifyListeners();
  }
}
