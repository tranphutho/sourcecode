import 'dart:convert';

import 'package:hires/core/constants/constants.dart';
import 'package:hires/models/applicant_detail_model.dart';
import 'package:hires/models/find_jobs.dart';
import 'package:http/http.dart' as http;

import 'api_urls.dart';

class GetServices {
  static findJobs() async {
    http.Response response;
    try {
      var data = {
        "orderBy": "new",
      };
      Uri uri = Uri(
          scheme: 'https',
          host: Constants.urlApi,
          path: 'api/find-jobs',
          queryParameters: data);

      response = await http.get(uri, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      });
      // response = await http.post(
      //   uri,
      //   headers: {
      //     "Accept": "application/json",
      //     "Content-Type": "application/json"
      //   },
      //   body: jsonEncode(data),
      // );
      // var body = json.decode(response.body);
      // print(body);

      //return findjobsFromJson(response.body);
      var body = json.decode(response.body);
      //print(body);

      return body;
    } catch (e) {
      return {'status': false, 'error': e};
    }
  }

  static getFeaturedJobs() async {
    http.Response response;
    try {
      var data = {
        "featured": "true",
        "orderBy": "new",
      };
      Uri uri = Uri(
          scheme: 'https',
          host: Constants.urlApi,
          path: 'api/find-jobs',
          queryParameters: data);
      //print(uri.toString());
      response = await http.get(uri, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      });
      // response = await http.post(
      //   uri,
      //   headers: {
      //     "Accept": "application/json",
      //     "Content-Type": "application/json"
      //   },
      //   body: jsonEncode(data),
      // );
      var body = json.decode(response.body);
      //print(body);

      return body;
    } catch (e) {
      return {'status': false, 'error': e};
    }
  }

  static getMyJob(String token) async {
    http.Response response;
    try {
      Uri uri = Uri(
        scheme: 'https',
        host: Constants.urlApi,
        path: 'api/my-jobs',
        // queryParameters: data
      );
      //print(uri.toString());
      response = await http.get(uri, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      });
      // response = await http.post(
      //   uri,
      //   headers: {
      //     "Accept": "application/json",
      //     "Content-Type": "application/json"
      //   },
      //   body: jsonEncode(data),
      // );
      var body = json.decode(response.body);
      //print(body);

      return body;
    } catch (e) {
      return {'status': false, 'error': e};
    }
  }

  static getPopularJobs() async {
    http.Response response;
    try {
      var data = {
        "orderBy": "new",
      };
      Uri uri = Uri(
          scheme: 'https',
          host: Constants.urlApi,
          path: 'api/find-jobs',
          queryParameters: data);

      response = await http.get(uri, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      });
      // response = await http.post(
      //   uri,
      //   headers: {
      //     "Accept": "application/json",
      //     "Content-Type": "application/json"
      //   },
      //   body: jsonEncode(data),
      // );
      var body = json.decode(response.body);
      //print(body);

      return body;
    } catch (e) {
      return {'status': false, 'error': e};
    }
  }

  static getUrgentJobs() async {
    http.Response response;
    try {
      var data = {
        "urgent": "true",
      };
      Uri uri = Uri(
          scheme: 'https',
          host: Constants.urlApi,
          path: 'api/find-jobs',
          queryParameters: data);

      response = await http.get(uri, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      });
      // response = await http.post(
      //   uri,
      //   headers: {
      //     "Accept": "application/json",
      //     "Content-Type": "application/json"
      //   },
      //   body: jsonEncode(data),
      // );
      var body = json.decode(response.body);
      //print(body);

      return body;
    } catch (e) {
      return {'status': false, 'error': e};
    }
  }

  static getApplicantDetai(int id, String token) async {
    http.Response response;
    try {
      var data = {
        "orderBy": "new",
      };

      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token}"
      };
      response = await http.get(Uri.parse(Api_Url.APPLICANTDETAIL + "/$id"),
          headers: headers);
      print(response.body);

      // Uri uri = Uri(
      //     scheme: 'https',
      //     host: Constants.urlApi,
      //     path: 'api/find-jobs',
      //     queryParameters: data);

      // response = await http.post(
      //   uri,
      //   headers: {
      //     "Accept": "application/json",
      //     "Content-Type": "application/json"
      //   },
      //   body: jsonEncode(data),
      // );
      var body = json.decode(response.body);

      return body;
    } catch (e) {
      return {'status': false, 'error': e};
    }
  }

  static getWishlist(String token) async {
    http.Response response;
    try {
      // var data = {
      //   "featured": "true",
      //   "orderBy": "new",
      // };
      Uri uri = Uri(
        scheme: 'https',
        host: Constants.urlApi,
        path: 'api/wishlist',
        // queryParameters: data
      );
      //print(uri.toString());
      response = await http.get(uri, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      });
      // response = await http.post(
      //   uri,
      //   headers: {
      //     "Accept": "application/json",
      //     "Content-Type": "application/json"
      //   },
      //   body: jsonEncode(data),
      // );
      var body = json.decode(response.body);
      //print(body);

      return body;
    } catch (e) {
      return {'status': false, 'error': e};
    }
  }

  static getApplicants(String token) async {
    http.Response response;
    try {
      var data = {
        "featured": "true",
        "orderBy": "new",
      };
      Uri uri = Uri(
        scheme: 'https',
        host: Constants.urlApi,
        path: 'api/applicants',
        // queryParameters: data,
      );
      //print(uri.toString());
      response = await http.get(uri, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      });
      // response = await http.post(
      //   uri,
      //   headers: {
      //     "Accept": "application/json",
      //     "Content-Type": "application/json"
      //   },
      //   body: jsonEncode(data),
      // );
      var body = json.decode(response.body);
      //print(body);

      return body;
    } catch (e) {
      return {'status': false, 'error': e};
    }
  }

  static getResource() async {
    http.Response response;
    try {
      var data = {
        "featured": "true",
        "orderBy": "new",
      };
      Uri uri = Uri(
        scheme: 'https',
        host: Constants.urlApi,
        path: 'api/job-resource',
        // queryParameters: data,
      );
      //print(uri.toString());
      response = await http.get(uri, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        // "Authorization": "Bearer $token"
      });
      // response = await http.post(
      //   uri,
      //   headers: {
      //     "Accept": "application/json",
      //     "Content-Type": "application/json"
      //   },
      //   body: jsonEncode(data),
      // );
      var body = json.decode(response.body);
      //print(body);

      return body;
    } catch (e) {
      return {'status': false, 'error': e};
    }
  }

  static getCountries() async {
    http.Response response;
    try {
      var data = {
        "featured": "true",
        "orderBy": "new",
      };
      Uri uri = Uri(
        scheme: 'https',
        host: Constants.urlApi,
        path: 'api/countries',
        // queryParameters: data,
      );
      //print(uri.toString());
      response = await http.get(uri, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        // "Authorization": "Bearer $token"
      });
      // response = await http.post(
      //   uri,
      //   headers: {
      //     "Accept": "application/json",
      //     "Content-Type": "application/json"
      //   },
      //   body: jsonEncode(data),
      // );
      var body = json.decode(response.body);
      //print(body);

      return body;
    } catch (e) {
      return {'status': false, 'error': e};
    }
  }
}
