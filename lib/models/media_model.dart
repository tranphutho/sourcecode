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

class MediasModel {
  MediasModel({
    this.data,
  });

  List<MediaModel>? data;

  factory MediasModel.fromJson(Map<String, dynamic> json) => MediasModel(
        data: json["data"] == null
            ? null
            : List<MediaModel>.from(
                json["data"].map((x) => MediaModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<MediaModel>.from(data!.map((x) => x.toJson())),
      };
}

class MediaModel {
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

  MediaModel(
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

  MediaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? json['id'] : null;
    fileName = json['file_name'] != null ? json['file_name'] : null;
    filePath = json['file_path'] != null ? json['file_path'] : null;
    fileSize = json['file_size'] != null ? json['file_size'] : null;
    fileType = json['file_type'] != null ? json['file_type'] : null;
    fileExtension =
        json['file_extension'] != null ? json['file_extension'] : null;
    createUser = json['create_user'] != null ? json['create_user'] : null;
    updateUser = json['update_user'] != null ? json['update_user'] : null;
    deletedAt =
        json['deleted_at'] != null ? DateTime.parse(json['deleted_at']) : null;
    appId = json['app_id'] != null ? json['app_id'] : null;
    appUserId = json['app_user_id'] != null ? json['app_user_id'] : null;
    fileWidth = json['file_width'] != null ? json['file_width'] : null;
    fileHeight = json['file_height'] != null ? json['file_height'] : null;
    createdAt =
        json['created_at'] != null ? DateTime.parse(json['created_at']) : null;
    updatedAt =
        json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null;
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
        this.deletedAt != null ? this.deletedAt!.toIso8601String() : null;
    data['app_id'] = this.appId;
    data['app_user_id'] = this.appUserId;
    data['file_width'] = this.fileWidth;
    data['file_height'] = this.fileHeight;
    data['created_at'] =
        this.createdAt != null ? this.createdAt!.toIso8601String() : null;
    data['updated_at'] =
        this.updatedAt != null ? this.updatedAt!.toIso8601String() : null;
    return data;
  }
}

class MediaProvider extends ChangeNotifier {
  MediasModel? mediasModel;

  bool statusLogin = false;
  String mssgLogin = '';
  String emailToVerify = '';
  String resetTypeToVerify = '';

  RefreshController mediaRefreshController = RefreshController();

  Future intit() async {
    await getMediaImage();
  }

  Future<MediasModel?> getMediaImage() async {
    var body = await GetServices.getMediaImage();
    if (body["status"]) {
      if (body != null) {
        var data = body["data"];
        //applicantDetail = ApplicantDetailModel.fromJson();
        mediasModel = MediasModel.fromJson(body);
        notifyListeners();
        //print(jobsModel);
        return mediasModel;
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
