// import 'dart:convert';
// import 'dart:io';

// import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hires/core/constants/constants.dart';
import 'package:hires/models/applicant_detail_model.dart';

import 'package:hires/models/my_job_model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:chunked_uploader/chunked_uploader.dart';

import '../models/user_model.dart';
import 'api_urls.dart';

class PostServices {
  static applyJob(File file, String path, String fileName, String message,
      String id_job, String id_company, String token) async {
    //var file = File(path);
    Dio dio = new Dio();
    dio.options.headers["Accept"] = "application/json";
    // //dio.options.headers["Content-Type"] = "application/json";
    dio.options.headers["Authorization"] = "Bearer $token";
    // dio.options.baseUrl = Api_Url.BASE_URL;
    dio.options.contentType = "multipart/form-data";
    dio.options.method = "POST";
    try {
      var headers = {
        // "Accept": "application/json",
        // "Content-Type": "application/json",
        "Authorization": "Bearer ${token}"
      };
      // File file = File("fileBits", fileName);
      FormData formData = FormData.fromMap({
        // "cv_file": file,
        // "cv_file": fileName,
        "message": message,
        "company_id": id_company,
        "job_id": id_job
      });
      formData.files.add(MapEntry(
          'cv_file', MultipartFile.fromFileSync(path, filename: fileName)));

      var response = await dio.post(
        Api_Url.APPLY_JOB,
        data: formData,
      );

      // var response = await request.send();
      return response.data;
    } catch (e) {
      return {'status': false, 'error': e};
    }
  }

  // static applyJob(File file, String path, String fileName, String message,
  //     String id_company, String id_job, String token) async {
  //   try {
  //     String url = 'https://awaitanthony.com/demo/api/v1/file_upload';
  //     ChunkedUploader chunkedUploader = ChunkedUploader(
  //       Dio(
  //         BaseOptions(
  //           baseUrl: Api_Url.APPLY_JOB,
  //           headers: {
  //             'Content-Type': 'multipart/form-data',
  //             'Connection': 'Keep-Alive',
  //             "Authorization": "Bearer ${token}"
  //           },
  //         ),
  //       ),
  //     );

  //     Response? response = await chunkedUploader.upload(
  //       fileKey: "cv_file",
  //       method: "POST",
  //       filePath: path,
  //       maxChunkSize: 500000000,
  //       path: Api_Url.APPLY_JOB,
  //       data: {"message": message, "company_id": id_company, "job_id": id_job},
  //     );
  //     return response;
  //   } catch (e) {
  //     return {'status': false, 'error': e};
  //   }
  // }

//   static applyJob(File file, String path, String fileName, String message,
//       String id_job, String id_company, String token) async {
//     // setState(() {
//     //   showSpinner = true;
//     // });
//     var headers = {
//       // "Accept": "application/json",
//       // "Content-Type": "application/json",
//       "Authorization": "Bearer ${token}"
//     };
//     var stream = new http.ByteStream(
//       file!.openRead(),
//     );
//     stream.cast();

//     var length = await file!.length();

//     var uri = Uri.parse(Api_Url.APPLY_JOB);

//     var request = new http.MultipartRequest('POST', uri);
// //       "message": message,
//     //       "company_id": id_company,
//     //       "job_id": id_job
//     request.fields['message'] = message;
//     request.fields['id_company'] = id_company;
//     request.fields['id_job'] = id_job;
//     var byte = await file!.readAsBytes();
//     var multiport = new http.MultipartFile.fromBytes(
//       "cv_file",
//       byte,
//       filename: fileName,
//     ); //('cv_file', stream, length);

//     //request.files.add(multiport);
//     request.headers.addAll(headers);
//     var response = await request.send();

//     print(response.stream.toString());
//     if (response.statusCode == 200) {
//       // setState(() {
//       //   showSpinner = false;
//       // });
//       print('image uploaded');
//     } else {
//       print('failed');
//       // setState(() {
//       //   showSpinner = false;
//       // });
//     }
//   }

  static addWishlist(String id_job, String token) async {
    //var pref = await SharedPreferences.getInstance();
    //String token = pref.getString("token");
    try {
      var headers = {"Authorization": "Bearer $token"};
      var data = {
        "object_id": id_job,
        "object_model": "job",
      };
      http.Response response = await http.post(Uri.parse(Api_Url.ADD_WISHLIT),
          headers: headers, body: data);
      print(response.body);
      var body = json.decode(response.body);
      //print(body);

      return body;
    } catch (e) {
      return {'status': false, 'error': e};
    }
  }

  static remoteWishlist(String id_job, String token) async {
    //var pref = await SharedPreferences.getInstance();
    //String token = pref.getString("token");
    try {
      var headers = {"Authorization": "Bearer $token"};
      var data = {
        "object_id": id_job,
        "object_model": "job",
      };
      http.Response response = await http.post(
          Uri.parse(Api_Url.REMOVE_WISHLIT),
          headers: headers,
          body: data);
      print(response.body);
      var body = json.decode(response.body);
      //print(body);

      return body;
    } catch (e) {
      return {'status': false, 'error': e};
    }
  }

  static createUpdateJob(MyJob myJob) async {
    var pref = await SharedPreferences.getInstance();
    dynamic token = pref.get("token");
    try {
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      };
      var data = {};
      if (myJob.id == 0) {
        data = {
          "title": myJob.title,
          "content": myJob.content,
          "thumbnail_id": myJob.thumbnailId,
          "category_id": myJob.categoryId,
          "location_id": myJob.locationId,
          "job_type_id": myJob.jobTypeId,
          "expiration_date": myJob.expirationDate,
          "hours": myJob.hours,
          "hours_type": myJob.hoursType,
          "salary_min": myJob.salaryMin,
          "salary_max": myJob.salaryMax,
          "salary_type": myJob.salaryType,
          "gender": myJob.gender,
          "map_lat": myJob.mapLat,
          "map_lng": myJob.mapLng,
          "map_zoom": myJob.mapZoom,
          "experience": myJob.experience,
          "is_featured": myJob.isFeatured,
          "is_urgent": myJob.isUrgent,
          "status": myJob.status,
          "apply_type": myJob.applyType,
          "apply_link": myJob.applyLink,
          "apply_email": myJob.applyEmail,
          "wage_agreement": myJob.wageAgreement,
          "gallery": myJob.gallery != null
              ? myJob.gallery!.replaceAll(r'(', '').replaceAll(r')', '')
              : "",
          "video": myJob.video,
          "video_cover_id": myJob.videoCoverId,
          "number_recruitments": myJob.numberRecruitment,
          "job_skills": myJob.jobSkills,
        };
      } else {
        data = {
          "id": myJob.id,
          "title": myJob.title,
          "content": myJob.content,
          "thumbnail_id": myJob.thumbnailId,
          "category_id": myJob.categoryId,
          "location_id": myJob.locationId,
          "job_type_id": myJob.jobTypeId,
          "expiration_date": myJob.expirationDate,
          "hours": myJob.hours,
          "hours_type": myJob.hoursType,
          "salary_min": myJob.salaryMin,
          "salary_max": myJob.salaryMax,
          "salary_type": myJob.salaryType,
          "gender": myJob.gender,
          "map_lat": myJob.mapLat,
          "map_lng": myJob.mapLng,
          "map_zoom": myJob.mapZoom,
          "experience": myJob.experience,
          "is_featured": myJob.isFeatured,
          "is_urgent": myJob.isUrgent,
          "status": myJob.status,
          "apply_type": myJob.applyType,
          "apply_link": myJob.applyLink,
          "apply_email": myJob.applyEmail,
          "wage_agreement": myJob.wageAgreement,
          "gallery": myJob.gallery,
          "video": myJob.video,
          "video_cover_id": myJob.videoCoverId,
          "number_recruitments": myJob.numberRecruitment,
          "job_skills": myJob.jobSkills,
        };
      }
      print(data);
      http.Response response = await http.post(
          Uri.parse(Api_Url.CREATE_UPDATE_MYJOB),
          headers: headers,
          body: jsonEncode(data));
      print(response.body);
      var body = json.decode(response.body);
      //print(body);

      return body;
    } catch (e) {
      return {'status': false, 'error': e};
    }
  }

  static destroyMyJob(String id_job, String token) async {
    //var pref = await SharedPreferences.getInstance();
    //String token = pref.getString("token");
    try {
      var headers = {"Authorization": "Bearer $token"};
      // var data = {
      //   "object_id": id_job,
      //   "object_model": "job",
      // };
      http.Response response = await http.delete(
        Uri.parse(Api_Url.DESTROY_MYJOB + "/" + id_job),
        headers: headers,
        // body: data,
      );
      print(response.body);
      var body = json.decode(response.body);
      //print(body);

      return body;
    } catch (e) {
      return {'status': false, 'error': e};
    }
  }

  static postMedia(File file, String token) async {
    //var file = File(path);
    Dio dio = new Dio();
    dio.options.headers["Accept"] = "application/json";
    // //dio.options.headers["Content-Type"] = "application/json";
    dio.options.headers["Authorization"] = "Bearer $token";
    // dio.options.baseUrl = Api_Url.BASE_URL;
    dio.options.contentType = "multipart/form-data";
    dio.options.method = "POST";
    try {
      var headers = {
        // "Accept": "application/json",
        // "Content-Type": "application/json",
        "Authorization": "Bearer ${token}"
      };
      // File file = File("fileBits", fileName);
      FormData formData = FormData.fromMap({
        // "cv_file": file,
        // "cv_file": fileName,
        "type": "image",
      });
      formData.files.add(MapEntry(
          'file',
          MultipartFile.fromFileSync(file.path,
              filename: file.path.split("/").last)));

      var response = await dio.post(
        Api_Url.POST_MEDIA,
        data: formData,
      );

      // var response = await request.send();
      return response.data;
    } catch (e) {
      return {'status': false, 'error': e};
    }
  }

  static updateProfileCompany(Company company, String token) async {
    //var pref = await SharedPreferences.getInstance();
    //String token = pref.getString("token");
    try {
      var headers = {"Authorization": "Bearer $token"};
      var data = {};

      data = {
        "name": company.name,
        "email": company.email,
        "phone": company.phone,
        "website": company.website,
        "location_id": company.locationId.toString(),
        "avatar_id": company.avatarId.toString(),
        "founded_in": company.foundedIn,
        "category_id": company.categoryId.toString(),
        "map_lat": company.mapLat,
        "map_lng": company.mapLng,
        "status": company.status,
        "about": company.about,
        "social_media":
            "{\"facebook\":\"${company.socialMedia!.facebook!}\",\"skype\":\"${company.socialMedia!.skype!}\",\"linkedin\":\"${company.socialMedia!.linkedin!}\",\"twitter\":\"${company.socialMedia!.twitter!}\",\"instagram\":\"${company.socialMedia!.instagram!}\",\"google\":\"${company.socialMedia!.google!}\"}",
        "city": company.city,
        "state": company.state,
        "country": company.country,
        "address": company.address,
        "team_size": company.teamSize.toString(),
        "is_featured": company.isFeatured.toString(),
        "zip_code": company.zipCode.toString(),
        "allow_search": company.allowSearch.toString(),
      };

      http.Response response = await http.post(
          Uri.parse(Api_Url.UPDATE_PROFILE_COMPANY),
          headers: headers,
          body: data);
      print(response.body);
      var body = json.decode(response.body);
      //print(body);

      return body;
    } catch (e) {
      return {'status': false, 'error': e};
    }
  }
}
