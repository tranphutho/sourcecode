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
import 'package:hires/models/find_jobs.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
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
}
