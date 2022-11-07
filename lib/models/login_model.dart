// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.data,
  });

  bool? status;
  Data? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.emailVerifiedAt,
    this.verificationCode,
    this.birthday,
    this.lastLoginAt,
    this.avatarId,
    this.bio,
    this.status,
    this.createUser,
    this.updateUser,
    this.vendorCommissionAmount,
    this.vendorCommissionType,
    this.roleId,
    this.billingLastName,
    this.billingFirstName,
    this.country,
    this.state,
    this.city,
    this.zipCode,
    this.address,
    this.address2,
    this.paymentGateway,
    this.totalGuests,
    this.locale,
    this.verifySubmitStatus,
    this.isVerified,
    this.needUpdatePw,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.token,
  });

  int? id;
  String? name;
  dynamic firstName;
  dynamic lastName;
  String? email;
  String? phone;
  dynamic emailVerifiedAt;
  String? verificationCode;
  dynamic birthday;
  dynamic lastLoginAt;
  dynamic avatarId;
  dynamic bio;
  String? status;
  dynamic createUser;
  dynamic updateUser;
  dynamic vendorCommissionAmount;
  dynamic vendorCommissionType;
  int? roleId;
  dynamic billingLastName;
  dynamic billingFirstName;
  dynamic country;
  dynamic state;
  dynamic city;
  dynamic zipCode;
  dynamic address;
  dynamic address2;
  String? paymentGateway;
  int? totalGuests;
  String? locale;
  String? verifySubmitStatus;
  int? isVerified;
  int? needUpdatePw;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
        emailVerifiedAt: json["email_verified_at"],
        verificationCode: json["verification_code"] == null
            ? null
            : json["verification_code"],
        birthday: json["birthday"],
        lastLoginAt: json["last_login_at"],
        avatarId: json["avatar_id"],
        bio: json["bio"],
        status: json["status"] == null ? null : json["status"],
        createUser: json["create_user"],
        updateUser: json["update_user"],
        vendorCommissionAmount: json["vendor_commission_amount"],
        vendorCommissionType: json["vendor_commission_type"],
        roleId: json["role_id"] == null ? null : json["role_id"],
        billingLastName: json["billing_last_name"],
        billingFirstName: json["billing_first_name"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        zipCode: json["zip_code"],
        address: json["address"],
        address2: json["address2"],
        paymentGateway:
            json["payment_gateway"] == null ? null : json["payment_gateway"],
        totalGuests: json["total_guests"] == null ? null : json["total_guests"],
        locale: json["locale"] == null ? null : json["locale"],
        verifySubmitStatus: json["verify_submit_status"] == null
            ? null
            : json["verify_submit_status"],
        isVerified: json["is_verified"] == null ? null : json["is_verified"],
        needUpdatePw:
            json["need_update_pw"] == null ? null : json["need_update_pw"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "first_name": firstName,
        "last_name": lastName,
        "email": email == null ? null : email,
        "phone": phone == null ? null : phone,
        "email_verified_at": emailVerifiedAt,
        "verification_code": verificationCode == null ? null : verificationCode,
        "birthday": birthday,
        "last_login_at": lastLoginAt,
        "avatar_id": avatarId,
        "bio": bio,
        "status": status == null ? null : status,
        "create_user": createUser,
        "update_user": updateUser,
        "vendor_commission_amount": vendorCommissionAmount,
        "vendor_commission_type": vendorCommissionType,
        "role_id": roleId == null ? null : roleId,
        "billing_last_name": billingLastName,
        "billing_first_name": billingFirstName,
        "country": country,
        "state": state,
        "city": city,
        "zip_code": zipCode,
        "address": address,
        "address2": address2,
        "payment_gateway": paymentGateway == null ? null : paymentGateway,
        "total_guests": totalGuests == null ? null : totalGuests,
        "locale": locale == null ? null : locale,
        "verify_submit_status":
            verifySubmitStatus == null ? null : verifySubmitStatus,
        "is_verified": isVerified == null ? null : isVerified,
        "need_update_pw": needUpdatePw == null ? null : needUpdatePw,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
        "token": token == null ? null : token,
      };
}
