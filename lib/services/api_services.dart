// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:eat_central_customers/Models/Api_Models/Get_Addresses.dart';
// import 'package:eat_central_customers/Models/Api_Models/Get_Home_Model.dart';
// import 'package:eat_central_customers/Models/Api_Models/Login_Model.dart';
// import 'package:eat_central_customers/Models/Api_Models/Placing_order.dart';
// import 'package:eat_central_customers/Models/Api_Models/Register_Model.dart';
// import 'package:eat_central_customers/Models/cart_model.dart';
// import 'package:eat_central_customers/Services/Api_URLs.dart';
// import 'package:eat_central_customers/Utils/Dialouge_Boxes.dart';
// import 'package:eat_central_customers/Utils/locations.dart';
// import 'package:eat_central_customers/Views/Auth/Controllers/GetStorag_Controller.dart';
// import 'package:flutter/services.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
// class ApiServices {
//   static var client = http.Client();
//
// //<-------------------------- REGISTRATION API START -------------------------->
//   static Future api_registeration({
//     required String name,
//     required String email,
//     required String password,
//     required String confirm_password,
//     required String phone,
//   }) async {
//     Position position = await GetLocation.getGeoLocationPosition();
//     print(email);
//     print(password);
//     print(position.latitude);
//     print(position.longitude);
//     Map<String, String> body = {
//       "name": name,
//       "email": email,
//       "password": password,
//       "confirm_password": confirm_password,
//       "phone": phone,
//       "longitude": position.longitude.toString(),
//       "latitude": position.latitude.toString(),
//       "usertype": "customer",
//     };
//     print("Api Url: " + Api_Url.REGISTER.toString());
//     var response = await client.post(Uri.parse(Api_Url.REGISTER), body: body);
//     print(response.body);
//     final requestbody = json.decode(response.body);
//     try {
//       if (response.statusCode == 200) {
//         print("API response good api_urls.Signup");
//         return registerModelFromJson(response.body);
//       } else if (response.statusCode == 401) {
//         if (requestbody["error"]["email"].toString() ==
//             "[The email has already been taken.]") {
//           return Dialouge_Box.show_snackBarError(
//               title: "Error", description: "The email has already been taken.");
//         } else if (requestbody["error"]["phone"].toString() ==
//             "[The phone has already been taken.]") {
//           return Dialouge_Box.show_snackBarError(
//               title: "Error", description: "The phone has already been taken.");
//         } else
//           return null;
//       } else
//         return null;
//     } on PlatformException catch (e) {
//       print("platformException from services");
//       print(e);
//       Dialouge_Box.show_snackBarError(
//           title: "Error", description: e.message.toString());
//     } catch (e) {
//       Dialouge_Box.show_snackBarError(
//           title: "Error", description: requestbody["message"]);
//     }
//   }
//
// //<-------------------------- LOGIN API START -------------------------->
//
//   static Future api_login({
//     required String email,
//     required String password,
//   }) async {
//     Position position = await GetLocation.getGeoLocationPosition();
//     var address = await GetLocation.GetAddressFromLatLong(position);
//     print(email);
//     print(password);
//     print(position.latitude);
//     print(position.longitude);
//     print(address.toString());
//     Get.find<GetSTorageController>()
//         .box
//         .write(P_LATITUDE, position.latitude.toString());
//     Get.find<GetSTorageController>()
//         .box
//         .write(P_LONGITUDE, position.longitude.toString());
//     Get.find<GetSTorageController>().box.write(P_ADDRESS, address);
//     Map<String, String> body = {
//       "email": email,
//       "password": password,
//       "longitude": position.longitude.toString(),
//       "latitude": position.latitude.toString(),
//       "address": address.toString(),
//       "usertype": "customer",
//     };
//     print("Api Url: " + Api_Url.LOGIN.toString());
//     var response = await client.post(Uri.parse(Api_Url.LOGIN), body: body);
//     print(response.body);
//     final requestbody = json.decode(response.body);
//     Get.find<GetSTorageController>().box.write("token", requestbody["token"]);
//
//     try {
//       if (response.statusCode == 200) {
//         print("API response good api_urls.LOGIN");
//         return loginModelFromJson(response.body);
//       } else if (response.statusCode == 401) {
//         return Dialouge_Box.show_snackBarError(
//             title: "Error", description: requestbody["message"]);
//       } else
//         return Dialouge_Box.show_snackBarError(
//             title: "Error", description: requestbody["message"]);
//     } on PlatformException catch (e) {
//       print("platformException from services");
//       print(e);
//       Dialouge_Box.show_snackBarError(
//           title: "Error", description: requestbody["message"].toString());
//     } catch (e) {
//       Dialouge_Box.show_snackBarError(
//           title: requestbody["error"].toString(),
//           description: requestbody["message"].toString());
//     }
//   }
//
//   //<-------------------------- GOOGLE LOGIN API START -------------------------->
//
//   static Future api_google_login({
//     required String name,
//     required String email,
//     required String password,
//     required String phone,
//   }) async {
//     Position position = await GetLocation.getGeoLocationPosition();
//     var address = await GetLocation.GetAddressFromLatLong(position);
//     print(email);
//     print(password);
//     print(position.latitude);
//     print(position.longitude);
//     print(address.toString());
//     Map<String, String> body = {
//       "name": name,
//       "email": email,
//       "password": password,
//       "phone": phone,
//       "longitude": position.longitude.toString(),
//       "latitude": position.latitude.toString(),
//       "usertype": "customer",
//       "address": address.toString(),
//     };
//     print("Api Url: " + Api_Url.GOOGLE_LOGIN.toString());
//     var response =
//         await client.post(Uri.parse(Api_Url.GOOGLE_LOGIN), body: body);
//     print(response.body);
//     final requestbody = json.decode(response.body);
//     Get.find<GetSTorageController>().box.write("token", requestbody["token"]);
//     try {
//       if (response.statusCode == 200) {
//         print("API response good api_urls.GOOGLE_LOGIN");
//         return registerModelFromJson(response.body);
//       } else if (response.statusCode == 401) {
//         return Dialouge_Box.show_snackBarError(
//             title: "Error", description: "Unauthorized");
//       } else
//         return null;
//     } on PlatformException catch (e) {
//       print("platformException from services");
//       print(e);
//       Dialouge_Box.show_snackBarError(
//           title: "Error", description: e.message.toString());
//     } catch (e) {
//       Dialouge_Box.show_snackBarError(
//           title: "Error", description: requestbody["error"]);
//     }
//   }
//
// //<-------------------------- GET HOME API START -------------------------->
//
//   static Future<GetHome> api_get_home() async {
//     var response = await http.get(
//         Uri.parse(
//             "https://eatcentral.xyrontech.com/api/customer-home?latitude=7&longitude=2"),
//         headers: {
//           'Authorization': "Bearer " +
//               Get.find<GetSTorageController>()
//                   .getloginModel()!
//                   .data!
//                   .token
//                   .toString()
//         });
//
//     print(response.body.toString());
//     if (response.toString() != "null" &&
//         response.body.toString() != "null" &&
//         response.statusCode == 200) {
//       return getHomeFromJson(response.body);
//     } else {
//       return GetHome();
//     }
//   }
//
//   //<-------------------------- ADD ADDRESES API START -------------------------->
//   static Future api_add_Addresses({
//     required String latitude,
//     required String longitude,
//     required String address,
//     required String label,
//     required String street,
//     required String sublocality,
//     required String locality,
//     required String country,
//   }) async {
//     Map<String, String> body = {
//       "latitude": latitude,
//       "longitude": longitude,
//       "address": address,
//       "label": label,
//       "street": street,
//       "sublocality": sublocality,
//       "country": country,
//       "locality": locality,
//     };
//     print("<-------------------Api Url-------------------->");
//     print(Api_Url.ADD_ADDRESS.toString());
//     var response =
//         await client.post(Uri.parse(Api_Url.ADD_ADDRESS), body: body, headers: {
//       'Authorization': "Bearer " +
//           Get.find<GetSTorageController>()
//               .getloginModel()!
//               .data!
//               .token
//               .toString()
//     });
//     print(response.body);
//     final requestbody = json.decode(response.body);
//     try {
//       if (response.statusCode == 200) {
//         print("API response good api_urls.ADD ADDRESSES");
//         return requestbody;
//       } else
//         return null;
//     } on PlatformException catch (e) {
//       print("platformException from services");
//       print(e);
//       Dialouge_Box.show_snackBarError(
//           title: "Error", description: e.message.toString());
//     } catch (e) {
//       Dialouge_Box.show_snackBarError(
//           title: "Error", description: requestbody["message"]);
//     }
//   }
//
//   //<-------------------------- UPDATE ADDRESES API START -------------------------->
//   static Future api_update_Addresses({
//     required String latitude,
//     required String longitude,
//     required String address,
//     required String label,
//     required String street,
//     required String sublocality,
//     required String locality,
//     required String country,
//     required final id,
//   }) async {
//     Map<String, String> body = {
//       "latitude": latitude,
//       "longitude": longitude,
//       "address": address,
//       "label": label,
//       "street": street,
//       "sublocality": sublocality,
//       "country": country,
//       "locality": locality,
//       "id": id,
//     };
//     print("<-------------------Api Url-------------------->");
//     print(Api_Url.UPDATE_ADDRESS.toString());
//     var response = await client
//         .post(Uri.parse(Api_Url.UPDATE_ADDRESS), body: body, headers: {
//       'Authorization': "Bearer " +
//           Get.find<GetSTorageController>()
//               .getloginModel()!
//               .data!
//               .token
//               .toString()
//     });
//     print(response.body);
//     final requestbody = json.decode(response.body);
//     try {
//       if (response.statusCode == 200) {
//         print("API response good api_urls.ADD ADDRESSES");
//         return requestbody;
//       } else
//         return null;
//     } on PlatformException catch (e) {
//       print("platformException from services");
//       print(e);
//       Dialouge_Box.show_snackBarError(
//           title: "Error", description: e.message.toString());
//     } catch (e) {
//       Dialouge_Box.show_snackBarError(
//           title: "Error", description: requestbody["message"]);
//     }
//   }
//
//   //<-------------------------- DELETE ITEM API START -------------------------->
//
//   static Future api_delete_address({
//     final categoryId,
//   }) async {
//     log("Inside DELETE ADDRESS Api");
//     Map<String, String> body = {
//       "id": categoryId,
//     };
//     try {
//       var response = await http.post(Uri.parse(Api_Url.DELETE_ADDRESS),
//           headers: {
//             'Authorization': "Bearer " +
//                 Get.find<GetSTorageController>()
//                     .getloginModel()!
//                     .data!
//                     .token
//                     .toString()
//           },
//           body: body);
//       if (response.statusCode == 200) {
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//
//   //<-------------------------- GET ADDRSSSES API START -------------------------->
//
//   static Future<GetAddresses> api_GetAddress() async {
//     var response = await http.get(Uri.parse(Api_Url.GET_ADDRESS), headers: {
//       'Authorization': "Bearer " +
//           Get.find<GetSTorageController>()
//               .getloginModel()!
//               .data!
//               .token
//               .toString()
//     });
//
//     print(response.body.toString());
//     if (response.toString() != "null" &&
//         response.body.toString() != "null" &&
//         response.statusCode == 200) {
//       return getAddressesFromJson(response.body);
//     } else {
//       return GetAddresses();
//     }
//   }
//
// //<-------------------------- PLACE ADDRESS API  -------------------------->
//
//   static Future api_placeOrder({
//     required final business_id,
//     required final delivery_latitude,
//     required final delivery_longitude,
//     required List<FoodItem>? food_items,
//     required final delivery_address,
//     required final voucher_id,
//     required final total_price,
//   }) async {
//     log("Inside the Place Order Api ");
//     final food_item = jsonEncode(food_items);
//     Map<String, String> body = {
//       "business_id": business_id,
//       "delivery_latitude": delivery_latitude,
//       "delivery_longitude": delivery_longitude,
//       "delivery_address": delivery_address,
//       "voucher_id": voucher_id,
//       "total_price": total_price,
//       "food_items": food_item,
//     };
//     print("<-------------------Api Url-------------------->");
//     print(Api_Url.PLACE_ORDER.toString());
//     var response =
//         await client.post(Uri.parse(Api_Url.PLACE_ORDER), body: body, headers: {
//       'Authorization': "Bearer " +
//           Get.find<GetSTorageController>()
//               .getloginModel()!
//               .data!
//               .token
//               .toString()
//     });
//     final requestbody = json.decode(response.body);
//     try {
//       if (response.statusCode == 200) {
//         print("API response good api_urls.Place Oredr");
//         log(response.statusCode.toString());
//         log(response.body);
//         log("<------------------------Placing Order Response------------------->");
//         return placingOrderFromJson(response.body);
//       } else
//         return null;
//     } on PlatformException catch (e) {
//       print("platformException from services");
//       print(e);
//       Dialouge_Box.show_snackBarError(
//           title: "Error", description: e.message.toString());
//     } catch (e) {
//       Dialouge_Box.show_snackBarError(
//           title: "Error", description: requestbody["message"]);
//     }
//   }
// }
