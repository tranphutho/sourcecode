import 'package:hires/models/applicants_model.dart';

import 'media_model.dart';

class CvModel {
  int? id;
  int? fileId;
  int? originId;
  bool? isDefault;
  int? createUser;
  Null? updateUser;
  String? createdAt;
  String? updatedAt;
  MediaModel? media;

  CvModel(
      {this.id,
        this.fileId,
        this.originId,
        this.isDefault,
        this.createUser,
        this.updateUser,
        this.media,
        this.createdAt,
        this.updatedAt});

  CvModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileId = json['file_id'];
    originId = json['origin_id'];
    isDefault = json['is_default'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    createdAt = json['created_at'];
    media =json['media']!=null? MediaModel.fromJson(json['media']):null;

    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['file_id'] = this.fileId;
    data['origin_id'] = this.originId;
    data['is_default'] = this.isDefault;
    data['create_user'] = this.createUser;
    data['update_user'] = this.updateUser;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
