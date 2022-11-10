import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hires/core/constants/constants.dart';
import 'package:hires/models/job_model.dart';

import 'package:hires/services/login_sevice.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/utils/common_utils.dart';
import '../services/post_services.dart';

class UserModel {
  int? id;
  int? avatar_id;
  int? vendor_commission_amount;
  int? vendor_commission_type;
  int? role_id;
  String? name;
  String? first_name;
  String? last_name;
  String? email;
  String? phone;
  String? verification_code;
  String? token;
  String? bio;
  String? status;
  String? billing_last_name;
  String? billing_first_name;
  String? country;
  String? state;
  String? city;
  String? zip_code;
  String? address;
  String? address2;
  String? payment_gateway;
  String? locale;
  String? verify_submit_stat;
  int? total_guests;
  int? is_verified;
  int? need_update_pw;
  DateTime? birthday;
  DateTime? email_verified_at;
  DateTime? last_login_at;
  Company? company;

  //  "created_at"              : "2022-10-14T09:40:26.000000Z",
  //  "updated_at"              : "2022-10-14T21:46:37.000000Z",
  //  "deleted_at"              : null,
  //  "create_user"      : null,
  //  "update_user"      : null,

  UserModel(
      {this.id,
      this.avatar_id,
      this.vendor_commission_amount,
      this.vendor_commission_type,
      this.role_id,
      this.name,
      this.first_name,
      this.last_name,
      this.email,
      this.phone,
      this.verification_code,
      this.token,
      this.bio,
      this.status,
      this.billing_last_name,
      this.billing_first_name,
      this.country,
      this.state,
      this.city,
      this.zip_code,
      this.address,
      this.address2,
      this.payment_gateway,
      this.locale,
      this.verify_submit_stat,
      this.total_guests,
      this.is_verified,
      this.need_update_pw,
      this.birthday,
      this.email_verified_at,
      this.last_login_at,
      this.company});
  UserModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    avatar_id = map['avatar_id'];
    vendor_commission_amount = map['vendor_commission_amount'];
    vendor_commission_type = map['vendor_commission_type'];
    role_id = map['role_id'];
    name = map['name'];
    first_name = map['first_name'];
    last_name = map['last_name'];
    email = map['email'];
    phone = map['phone'];
    verification_code = map['verification_code'];
    token = map['token'] ?? '';
    bio = map['bio'];
    status = map['status'];
    billing_last_name = map['billing_last_name'];
    billing_first_name = map['billing_first_name'];
    country = map['country'];
    state = map['state'];
    city = map['city'];
    zip_code = map['zip_code'];
    address = map['address'];
    address2 = map['address2'];
    payment_gateway = map['payment_gateway'];
    locale = map['locale'];
    verify_submit_stat = map['verify_submit_stat'];
    total_guests = map['total_guests'];
    is_verified = map['is_verified'];
    need_update_pw = map['need_update_pw'];
    birthday = map['birthday'] == null ? null : DateTime.parse(map['birthday']);
    email_verified_at = map['email_verified_at'] == null
        ? null
        : DateTime.parse(map['email_verified_at']);
    last_login_at = map['last_login_at'] == null
        ? null
        : DateTime.parse(map['last_login_at']);
    company = map["company"] == null ? null : Company.fromJson(map["company"]);
  }

  Map<String, dynamic> userToJson() => {
        'id': id,
        'avatar_id': avatar_id,
        'vendor_commission_amount': vendor_commission_amount,
        'vendor_commission_type': vendor_commission_type,
        'role_id': role_id,
        'name': name,
        'first_name': first_name,
        'last_name': last_name,
        'email': email,
        'phone': phone,
        'verification_code': verification_code,
        'token': token,
        'bio': bio,
        'status': status,
        'billing_last_name': billing_last_name,
        'billing_first_name': billing_first_name,
        'country': country,
        'state': state,
        'city': city,
        'zip_code': zip_code,
        'address': address,
        'address2': address2,
        'payment_gateway': payment_gateway,
        'locale': locale,
        'verify_submit_stat': verify_submit_stat,
        'total_guests': total_guests,
        'is_verified': is_verified,
        'need_update_pw': need_update_pw,
        'birthday': birthday?.toIso8601String(),
        'email_verified_at': email_verified_at?.toIso8601String(),
        'last_login_at': last_login_at?.toIso8601String(),
        'company': company == null ? null : company!.toJson(),
      };
}

class Company {
  Company({
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
    this.updatedAt,
    this.avatarDetail,
  });

  int? id;
  String? name;
  String? email;
  String? phone;
  String? website;
  int? avatarId;
  dynamic coverId;
  String? foundedIn;
  int? allowSearch;
  dynamic isFeatured;
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
  dynamic mapLat;
  dynamic mapLng;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  AvatarDetail? avatarDetail;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
        website: json["website"] == null ? null : json["website"],
        avatarId: json["avatar_id"] == null ? null : json["avatar_id"],
        coverId: json["cover_id"],
        foundedIn: json["founded_in"] == null ? null : json["founded_in"],
        allowSearch: json["allow_search"] == null ? null : json["allow_search"],
        isFeatured: json["is_featured"],
        ownerId: json["owner_id"] == null ? null : json["owner_id"],
        locationId: json["location_id"] == null ? null : json["location_id"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        teamSize: json["team_size"] == null ? null : json["team_size"],
        about: json["about"] == null ? null : json["about"],
        socialMedia: json["social_media"] == null
            ? null
            : SocialMedia.fromJson(json["social_media"]),
        city: json["city"] == null ? null : json["city"],
        state: json["state"] == null ? null : json["state"],
        country: json["country"] == null ? null : json["country"],
        zipCode: json["zip_code"] == null ? null : json["zip_code"],
        address: json["address"] == null ? null : json["address"],
        slug: json["slug"] == null ? null : json["slug"],
        status: json["status"] == null ? null : json["status"],
        createUser: json["create_user"] == null ? null : json["create_user"],
        updateUser: json["update_user"] == null ? null : json["update_user"],
        mapLat: json["map_lat"],
        mapLng: json["map_lng"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        avatarDetail: json["avatar_detail"] == null
            ? null
            : AvatarDetail.fromJson(json["avatar_detail"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "phone": phone == null ? null : phone,
        "website": website == null ? null : website,
        "avatar_id": avatarId == null ? null : avatarId,
        "cover_id": coverId,
        "founded_in": foundedIn == null ? null : foundedIn,
        "allow_search": allowSearch == null ? null : allowSearch,
        "is_featured": isFeatured,
        "owner_id": ownerId == null ? null : ownerId,
        "location_id": locationId == null ? null : locationId,
        "category_id": categoryId == null ? null : categoryId,
        "team_size": teamSize == null ? null : teamSize,
        "about": about == null ? null : about,
        "social_media": socialMedia == null ? null : socialMedia!.toJson(),
        "city": city == null ? null : city,
        "state": state == null ? null : state,
        "country": country == null ? null : country,
        "zip_code": zipCode == null ? null : zipCode,
        "address": address == null ? null : address,
        "slug": slug == null ? null : slug,
        "status": status == null ? null : status,
        "create_user": createUser == null ? null : createUser,
        "update_user": updateUser == null ? null : updateUser,
        "map_lat": mapLat,
        "map_lng": mapLng,
        "deleted_at": deletedAt,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "avatar_detail": socialMedia == null ? null : avatarDetail!.toJson(),
      };
}

class AvatarDetail {
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

  AvatarDetail(
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

  AvatarDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileName = json['file_name'];
    filePath = json['file_path'];
    fileSize = json['file_size'];
    fileType = json['file_type'];
    fileExtension = json['file_extension'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    deletedAt =
        json['deleted_at'] == null ? null : DateTime.parse(json['deleted_at']);
    appId = json['app_id'];
    appUserId = json['app_user_id'];
    fileWidth = json['file_width'];
    fileHeight = json['file_height'];
    createdAt =
        json["created_at"] == null ? null : DateTime.parse(json["created_at"]);
    updatedAt =
        json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['file_name'] = this.fileName;
    data['file_path'] = this.filePath;
    data['file_size'] = this.fileSize;
    data['file_type'] = this.fileType;
    data['file_extension'] = this.fileExtension;
    data['create_user'] = this.createUser;
    data['update_user'] = this.updateUser;
    data['deleted_at'] =
        deletedAt == null ? null : deletedAt!.toIso8601String();
    data['app_id'] = this.appId;
    data['app_user_id'] = this.appUserId;
    data['file_width'] = this.fileWidth;
    data['file_height'] = this.fileHeight;
    data['created_at'] =
        createdAt == null ? null : createdAt!.toIso8601String();
    data['updated_at'] =
        updatedAt == null ? null : updatedAt!.toIso8601String();
    return data;
  }
}

class UserProvider extends ChangeNotifier {
  UserModel? userApp;
  bool statusLogin = false;
  String mssgLogin = '';
  String emailToVerify = '';
  String resetTypeToVerify = '';

  signUp(loginId, password) async {
    emailToVerify = loginId;
    Map body = await LoginService.signUpUser(loginId, password);
    if (body['status'] ?? false) {
      await getToastMessage(Constants.mssSuccUserRgster, Colors.green);
      return body['status'];
    } else {
      mssgLogin = body['message'] ?? Constants.mssgErrTryLater;
      if (body['message'].toString().trim().isEmpty)
        mssgLogin = Constants.mssgErrTryLater;
      await getToastMessage(mssgLogin, Colors.red);
      return false;
    }
  }

  updateProfile(email, password, first_name, last_name, birthday, avatar_id,
      bio, BuildContext context) async {
    Map body = await LoginService.updateProfile(
        firstname: first_name,
        lastname: last_name,
        bio: bio,
        context: context,
        password: password,
        email: email,
        birthday: birthday,
        image: avatar_id);
    if (body != null) {
      print("<-------------Update Successfully-------------->");
      await getToastMessage(Constants.mssSuccUserRgster, Colors.green);
      return body;
    } else {
      print("<-------------Not Updated-------------->");
      mssgLogin = body['message'] ?? Constants.mssgErrTryLater;
      if (body['message'].toString().trim().isEmpty)
        mssgLogin = Constants.mssgErrTryLater;
      await getToastMessage(mssgLogin, Colors.red);
      return false;
    }
  }

  verifyEmail(code) async {
    Map body = await LoginService.verifyEmail(emailToVerify, code);
    if (body['status'] ?? false) {
      await getToastMessage(body['message'], Colors.green);
      emailToVerify = '';
      return true;
    } else {
      var mssg = body['message'] ?? Constants.mssgErrTryLater;

      if (body['message'].toString().trim().isEmpty)
        mssg = Constants.mssgErrTryLater;

      await getToastMessage(mssg, Colors.red);
      return false;
    }
  }

  Future<bool> forgotPwd(resetType, emailOrPhone) async {
    emailToVerify = '';
    resetTypeToVerify = '';
    Map body = await LoginService.forgotPwd(resetType, emailOrPhone);
    if (body['status'] ?? false) {
      emailToVerify = emailOrPhone;
      resetTypeToVerify = resetType;
      await getToastMessage(body['message'], Colors.green);
      return true;
    } else {
      var mssg = body['message'] ?? Constants.mssgErrTryLater;

      if (body['message'].toString().trim().isEmpty)
        mssg = Constants.mssgErrTryLater;

      await getToastMessage(mssg, Colors.red);
      return false;
    }
  }

  Future<bool> resetPwd(code, password) async {
    Map body = await LoginService.resetPwd(
        resetTypeToVerify, emailToVerify, code, password);
    if (body['status'] ?? false) {
      emailToVerify = '';
      resetTypeToVerify = '';
      await getToastMessage(body['message'], Colors.green);
      return true;
    } else {
      var mssg = body['message'] ?? Constants.mssgErrTryLater;

      if (body['message'].toString().trim().isEmpty)
        mssg = Constants.mssgErrTryLater;

      await getToastMessage(mssg, Colors.red);
      return false;
    }
  }

  signIn(loginId, password) async {
    emailToVerify = '';
    Map body = await LoginService.loginUser(loginId, password);
    statusLogin = body['status'] ?? false;
    if (statusLogin) {
      userApp = UserModel.fromJson(body['data']);

      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString("token", body['data']['token']);
      final box = GetStorage();
      box.write("token", body["data"]["token"].toString());
      localStorage.setString("user", json.encode(body['data']));
    } else {
      mssgLogin = body['message'] ?? Constants.mssgErrTryLater;
      if (body['message'].toString().trim().isEmpty)
        mssgLogin = Constants.mssgErrTryLater;
      if (mssgLogin == Constants.mssgErrVerifyEmail) emailToVerify = loginId;
      await getToastMessage(mssgLogin, Colors.red);
    }
    notifyListeners();
  }

  getData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    if (localStorage.containsKey('user')) {
      var data = json.decode(localStorage.getString(
        "user",
      )!);
      userApp = UserModel.fromJson(data);
    }

    notifyListeners();
  }

  logout() async {
    // Map body = await LoginService.logout(userApp!.token);
    //  if(body['status']?? false)
    {
      statusLogin = false;
      userApp = null;
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.clear();
    }
    // else{
    //   var mssg = body['message']?? Constants.errTryLater;

    //   if(body['message'].toString().trim().isEmpty)
    //   mssg = Constants.errTryLater;

    //   getToastMessage(mssg, Colors.red);
    //   return false;
    // }
    notifyListeners();
  }

  Future<int?> postMedia(File file) async {
    var body = await PostServices.postMedia(file, userApp!.token!);

    var mssg = body['message'] ?? Constants.mssgErrTryLater;
    if (body["status"] == 1) {
      await getToastMessage("Upload success", Colors.red);
      return body["data"]["id"];
    } else if (body['message'].toString().trim().isEmpty) {
      mssg = Constants.mssgErrTryLater;
      await getToastMessage(mssg, Colors.red);
      return 0;
    } else {
      await getToastMessage(mssg, Colors.red);
      return 0;
    }
  }

  updateProfileCompany(Company company) async {
    var body =
        await PostServices.updateProfileCompany(company, userApp!.token!);

    var mssg = body['message'] ?? Constants.mssgErrTryLater;
    if (body["status"] == 1) {
      await getToastMessage("Upload success", Colors.red);
      return body["data"]["id"];
    } else if (body['message'].toString().trim().isEmpty) {
      mssg = Constants.mssgErrTryLater;
      await getToastMessage(mssg, Colors.red);
      return 0;
    } else {
      await getToastMessage(mssg, Colors.red);
      return 0;
    }
  }
}
