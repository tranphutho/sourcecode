import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hires/core/constants/constants.dart';
import 'package:hires/services/get_services.dart';
import 'package:hires/services/login_sevice.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/utils/common_utils.dart';

class ApplicantDetailModel {
  int? id;
  List<EducationModel>? education;
  List<ExperienceModel>? experience;
  // int? avatar_id;
  // int? vendor_commission_amount;
  // int? vendor_commission_type;
  // int? role_id;
  // String? name;
  // String? first_name;
  // String? last_name;
  // String? email;
  // String? phone;
  // String? verification_code;
  // String? token;
  // String? bio;
  // String? status;
  // String? billing_last_name;
  // String? billing_first_name;
  // String? country;
  // String? state;
  // String? city;
  // String? zip_code;
  // String? address;
  // String? address2;
  // String? payment_gateway;
  // String? locale;
  // String? verify_submit_stat;
  // int? total_guests;
  // int? is_verified;
  // int? need_update_pw;
  // DateTime? birthday;
  // DateTime? email_verified_at;
  // DateTime? last_login_at;

  //  "created_at"              : "2022-10-14T09:40:26.000000Z",
  //  "updated_at"              : "2022-10-14T21:46:37.000000Z",
  //  "deleted_at"              : null,
  //  "create_user"      : null,
  //  "update_user"      : null,

  ApplicantDetailModel({this.id, this.education, this.experience
      // this.avatar_id,
      // this.vendor_commission_amount,
      // this.vendor_commission_type,
      // this.role_id,
      // this.name,
      // this.first_name,
      // this.last_name,
      // this.email,
      // this.phone,
      // this.verification_code,
      // this.token,
      // this.bio,
      // this.status,
      // this.billing_last_name,
      // this.billing_first_name,
      // this.country,
      // this.state,
      // this.city,
      // this.zip_code,
      // this.address,
      // this.address2,
      // this.payment_gateway,
      // this.locale,
      // this.verify_submit_stat,
      // this.total_guests,
      // this.is_verified,
      // this.need_update_pw,
      // this.birthday,
      // this.email_verified_at,
      // this.last_login_at
      });
  ApplicantDetailModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    education = map["education"] == null
        ? null
        : List<EducationModel>.from(
            map["education"].map((x) => EducationModel.fromJson(x)));
    experience = map["experience"] == null
        ? null
        : List<ExperienceModel>.from(
            map["experience"].map((x) => ExperienceModel.fromJson(x)));
    // avatar_id = map['avatar_id'];
    // vendor_commission_amount = map['vendor_commission_amount'];
    // vendor_commission_type = map['vendor_commission_type'];
    // role_id = map['role_id'];
    // name = map['name'];
    // first_name = map['first_name'];
    // last_name = map['last_name'];
    // email = map['email'];
    // phone = map['phone'];
    // verification_code = map['verification_code'];
    // token = map['token'] ?? '';
    // bio = map['bio'];
    // status = map['status'];
    // billing_last_name = map['billing_last_name'];
    // billing_first_name = map['billing_first_name'];
    // country = map['country'];
    // state = map['state'];
    // city = map['city'];
    // zip_code = map['zip_code'];
    // address = map['address'];
    // address2 = map['address2'];
    // payment_gateway = map['payment_gateway'];
    // locale = map['locale'];
    // verify_submit_stat = map['verify_submit_stat'];
    // total_guests = map['total_guests'];
    // is_verified = map['is_verified'];
    // need_update_pw = map['need_update_pw'];
    // birthday = map['birthday'] == null ? null : DateTime.parse(map['birthday']);
    // email_verified_at = map['email_verified_at'] == null
    //     ? null
    //     : DateTime.parse(map['email_verified_at']);
    // last_login_at = map['last_login_at'] == null
    //     ? null
    //     : DateTime.parse(map['last_login_at']);
  }

  Map<String, dynamic> userToJson() => {
        'id': id,
        "education": education == null
            ? null
            : List<EducationModel>.from(experience!.map((x) => x.toJson())),
        "experience": experience == null
            ? null
            : List<ExperienceModel>.from(experience!.map((x) => x.toJson())),
        // 'avatar_id': avatar_id,
        // 'vendor_commission_amount': vendor_commission_amount,
        // 'vendor_commission_type': vendor_commission_type,
        // 'role_id': role_id,
        // 'name': name,
        // 'first_name': first_name,
        // 'last_name': last_name,
        // 'email': email,
        // 'phone': phone,
        // 'verification_code': verification_code,
        // 'token': token,
        // 'bio': bio,
        // 'status': status,
        // 'billing_last_name': billing_last_name,
        // 'billing_first_name': billing_first_name,
        // 'country': country,
        // 'state': state,
        // 'city': city,
        // 'zip_code': zip_code,
        // 'address': address,
        // 'address2': address2,
        // 'payment_gateway': payment_gateway,
        // 'locale': locale,
        // 'verify_submit_stat': verify_submit_stat,
        // 'total_guests': total_guests,
        // 'is_verified': is_verified,
        // 'need_update_pw': need_update_pw,
        // 'birthday': birthday?.toIso8601String(),
        // 'email_verified_at': email_verified_at?.toIso8601String(),
        // 'last_login_at': last_login_at?.toIso8601String(),
      };
}

class EducationModel {
// "from": "2008",
// "to": "2011",
// "location": "IOE purwanchal campus dharan",
// "reward": "Diploma in Computer engieering certificate",
// "information": "percentage = 65%"
  String? from;
  String? to;
  String? location;
  String? reward;
  String? information;

  EducationModel(
      {this.from, this.to, this.location, this.reward, this.information});
  EducationModel.fromJson(Map<String, dynamic> map) {
    from = map['from'];
    to = map['to'];
    location = map['location'];
    reward = map['reward'];
    information = map['information'];
  }

  Map<String, dynamic> toJson() => {
        'from': from,
        'to': to,
        'location': location,
        'reward': reward,
        'information': information,
      };
}

class ExperienceModel {
// "from": "2019",
// "to": "2020",
// "location": "Deltatech",
// "position": "Junior PHP Developer",
// "information": "Worked more than 1 year"
  String? from;
  String? to;
  String? location;
  String? position;
  String? information;

  ExperienceModel(
      {this.from, this.to, this.location, this.position, this.information});
  ExperienceModel.fromJson(Map<String, dynamic> map) {
    from = map['from'];
    to = map['to'];
    location = map['location'];
    position = map['position'];
    information = map['information'];
  }

  Map<String, dynamic> toJson() => {
        'from': from,
        'to': to,
        'location': location,
        'reward': position,
        'information': information,
      };
}

class ApplicantDetailModelProvider extends ChangeNotifier {
  ApplicantDetailModel? applicantDetail;
  bool statusLogin = false;
  String mssgLogin = '';

  getApplicantDetail(int id, String token) async {
    dynamic body = await GetServices.getApplicantDetai(id, token);
    statusLogin = body['status'] ?? false;
    if (statusLogin) {
      var data = body["data"];
      applicantDetail = ApplicantDetailModel.fromJson(data["row"]);
    } else {
      mssgLogin = body['message'] ?? Constants.mssgErrTryLater;
      if (body['message'].toString().trim().isEmpty)
        mssgLogin = Constants.mssgErrTryLater;
      // if (mssgLogin == Constants.mssgErrVerifyEmail) emailToVerify = loginId;
      await getToastMessage(mssgLogin, Colors.red);
    }
    notifyListeners();
  }

  // signUp(loginId, password) async {
  //   emailToVerify = loginId;
  //   Map body = await LoginService.signUpUser(loginId, password);
  //   if (body['status'] ?? false) {
  //     await getToastMessage(Constants.mssSuccUserRgster, Colors.green);
  //     return body['status'];
  //   } else {
  //     mssgLogin = body['message'] ?? Constants.mssgErrTryLater;
  //     if (body['message'].toString().trim().isEmpty)
  //       mssgLogin = Constants.mssgErrTryLater;
  //     await getToastMessage(mssgLogin, Colors.red);
  //     return false;
  //   }
  // }

  // updateProfile(email, password, first_name, last_name, birthday, avatar_id,
  //     bio, BuildContext context) async {
  //   Map body = await LoginService.updateProfile(
  //       firstname: first_name,
  //       lastname: last_name,
  //       bio: bio,
  //       context: context,
  //       password: password,
  //       email: email,
  //       birthday: birthday,
  //       image: avatar_id);
  //   if (body != null) {
  //     print("<-------------Update Successfully-------------->");
  //     await getToastMessage(Constants.mssSuccUserRgster, Colors.green);
  //     return body;
  //   } else {
  //     print("<-------------Not Updated-------------->");
  //     mssgLogin = body['message'] ?? Constants.mssgErrTryLater;
  //     if (body['message'].toString().trim().isEmpty)
  //       mssgLogin = Constants.mssgErrTryLater;
  //     await getToastMessage(mssgLogin, Colors.red);
  //     return false;
  //   }
  // }

  // verifyEmail(code) async {
  //   Map body = await LoginService.verifyEmail(emailToVerify, code);
  //   if (body['status'] ?? false) {
  //     await getToastMessage(body['message'], Colors.green);
  //     emailToVerify = '';
  //     return true;
  //   } else {
  //     var mssg = body['message'] ?? Constants.mssgErrTryLater;

  //     if (body['message'].toString().trim().isEmpty)
  //       mssg = Constants.mssgErrTryLater;

  //     await getToastMessage(mssg, Colors.red);
  //     return false;
  //   }
  // }

  // Future<bool> forgotPwd(resetType, emailOrPhone) async {
  //   emailToVerify = '';
  //   resetTypeToVerify = '';
  //   Map body = await LoginService.forgotPwd(resetType, emailOrPhone);
  //   if (body['status'] ?? false) {
  //     emailToVerify = emailOrPhone;
  //     resetTypeToVerify = resetType;
  //     await getToastMessage(body['message'], Colors.green);
  //     return true;
  //   } else {
  //     var mssg = body['message'] ?? Constants.mssgErrTryLater;

  //     if (body['message'].toString().trim().isEmpty)
  //       mssg = Constants.mssgErrTryLater;

  //     await getToastMessage(mssg, Colors.red);
  //     return false;
  //   }
  // }

  // Future<bool> resetPwd(code, password) async {
  //   Map body = await LoginService.resetPwd(
  //       resetTypeToVerify, emailToVerify, code, password);
  //   if (body['status'] ?? false) {
  //     emailToVerify = '';
  //     resetTypeToVerify = '';
  //     await getToastMessage(body['message'], Colors.green);
  //     return true;
  //   } else {
  //     var mssg = body['message'] ?? Constants.mssgErrTryLater;

  //     if (body['message'].toString().trim().isEmpty)
  //       mssg = Constants.mssgErrTryLater;

  //     await getToastMessage(mssg, Colors.red);
  //     return false;
  //   }
  // }

  // signIn(loginId, password) async {
  //   emailToVerify = '';
  //   Map body = await LoginService.loginUser(loginId, password);
  //   statusLogin = body['status'] ?? false;
  //   if (statusLogin) {
  //     userApp = ApplicantDetailModel.fromJson(body['data']);

  //     SharedPreferences localStorage = await SharedPreferences.getInstance();
  //     localStorage.setString("token", body['data']['token']);
  //     final box = GetStorage();
  //     box.write("token", body["data"]["token"].toString());
  //     localStorage.setString("user", json.encode(body['data']));
  //   } else {
  //     mssgLogin = body['message'] ?? Constants.mssgErrTryLater;
  //     if (body['message'].toString().trim().isEmpty)
  //       mssgLogin = Constants.mssgErrTryLater;
  //     if (mssgLogin == Constants.mssgErrVerifyEmail) emailToVerify = loginId;
  //     await getToastMessage(mssgLogin, Colors.red);
  //   }
  //   notifyListeners();
  // }

  // getData() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   if (localStorage.containsKey('user')) {
  //     var data = json.decode(localStorage.getString(
  //       "user",
  //     )!);
  //     userApp = ApplicantDetailModel.fromJson(data);
  //   }

  //   notifyListeners();
  // }

  // logout() async {
  //   // Map body = await LoginService.logout(userApp!.token);
  //   //  if(body['status']?? false)
  //   {
  //     statusLogin = false;
  //     userApp = null;
  //     SharedPreferences localStorage = await SharedPreferences.getInstance();
  //     localStorage.clear();
  //   }
  //   // else{
  //   //   var mssg = body['message']?? Constants.errTryLater;

  //   //   if(body['message'].toString().trim().isEmpty)
  //   //   mssg = Constants.errTryLater;

  //   //   getToastMessage(mssg, Colors.red);
  //   //   return false;
  //   // }
  //   notifyListeners();
  // }
}
