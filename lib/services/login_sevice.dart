import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hires/core/constants/constants.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static signUpUser(loginId, password) async {
    http.Response response;
    try {
      Uri uri =
          Uri(scheme: 'https', host: Constants.urlApi, path: 'api/register');
      var data = {"email": loginId, "password": password};
      response = await http.post(
        uri,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode(data),
      );
      var body = json.decode(response.body);
      print(body);

      return body;
    } catch (e) {
      return {'status': false, 'error': e};
    }
  }

  static loginUser(loginId, password) async {
    http.Response response;
    try {
      Uri uri = Uri(scheme: 'https', host: Constants.urlApi, path: 'api/login');
      var data = {"login_id": loginId, "password": password};
      response = await http.post(
        uri,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode(data),
      );
      Map body = json.decode(response.body);
      print(body);
      log(body["data"]["token"].toString());

      return body;
    } catch (e) {
      return {'status': false, 'error': e};
    }
  }

  static logout(token) async {
    http.Response response;
    try {
      Uri uri =
          Uri(scheme: 'https', host: Constants.urlApi, path: 'api/logout');
      var data = {"token": token};
      response = await http.post(
        uri,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode(data),
      );
      var body = json.decode(response.body);
      print(body);

      return body;
    } catch (e) {
      return {'status': false, 'error': e};
    }
  }

  static verifyEmail(email, code) async {
    http.Response response;
    try {
      Uri uri = Uri(
          scheme: 'https', host: Constants.urlApi, path: 'api/verify-email');
      var data = {"email": email, "code": code};
      response = await http.post(
        uri,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode(data),
      );
      var body = json.decode(response.body);
      print(body);

      return body;
    } catch (e) {
      return {'status': false, 'error': e};
    }
  }

  static forgotPwd(resetType, email) async {
    http.Response response;
    try {
      Uri uri = Uri(
          scheme: 'https', host: Constants.urlApi, path: 'api/forgot-password');
      var data = {"reset_type": resetType, "reset_id": email};
      response = await http.post(
        uri,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode(data),
      );
      var body = json.decode(response.body);
      print(body);

      return body;
    } catch (e) {
      return {'status': false, 'error': e};
    }
  }

  static resetPwd(resetType, email, code, password) async {
    http.Response response;
    try {
      Uri uri = Uri(
          scheme: 'https', host: Constants.urlApi, path: 'api/set-password');
      var data = {
        "reset_type": resetType,
        "reset_id": email,
        "code": code,
        "password": password
      };
      response = await http.post(
        uri,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode(data),
      );
      var body = json.decode(response.body);
      print(body);

      return body;
    } catch (e) {
      return {'status': false, 'error': e};
    }
  }

  static updateProfile(
      {required String firstname,
      required String lastname,
      required String bio,
      required String password,
      required String email,
      required String birthday,
      required String image,
      required BuildContext context}) async {
    Uri uri = Uri(
        scheme: 'https', host: Constants.urlApi, path: 'api/profile-update');
    var request = http.MultipartRequest('POST', uri);
    request.fields.addAll({
      "email": email,
      "password": password,
      "first_name": firstname,
      "last_name": lastname,
      "birthday": birthday,
      "bio": bio,
    });
    request.files.add(await http.MultipartFile.fromPath('avatar_id', image));
    final box = GetStorage();
    box.read("token");
    request.headers.addAll(
      {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "64|svADUZjRVwRNUCqolg7kJybdyD2Y6Jb5IigD0Ger"
      },
    );
    http.StreamedResponse response = await request.send();
    String responseBody = await response.stream.bytesToString();

    Map mapBody = jsonDecode(responseBody);
    try {
      if (response.statusCode == 200) {
        return mapBody;
      } else {
        snackBar(context, mapBody["message"].toString(), Colors.grey);
        print(response.statusCode.toString());
        return null;
      }
    } on PlatformException catch (e) {
      print("platformException from services");
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
  }
}

snackBar(
  BuildContext context,
  String mainText,
  Color backgroundColor,
) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(mainText),
    backgroundColor: backgroundColor,
  ));
}
