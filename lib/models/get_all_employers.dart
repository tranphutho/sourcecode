// import 'dart:convert';
//
// GetEmployers getEmployersFromJson(String str) =>
//     GetEmployers.fromJson(json.decode(str));
//
// String getEmployersToJson(GetEmployers data) =>
//     json.encode(data.toJson());
//
// class GetEmployers {
//   GetEmployers({
//     this.status,
//     this.data
//   });
//
//   bool? status;
//   List<EmployersData>? data;
//
//   factory GetEmployers.fromJson(Map<String, dynamic> json) => GetEmployers(
//     status: json["status"] == null ? null : json["status"],
//     data: json["data"] == null
//         ? null
//         : List<EmployersData>.from(json["data"].map((x) => EmployersData.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status == null ? null : status,
//     "data": data == null
//       ? null
//       : List<dynamic>.from(data!.map((x) => x.toJson())),
//   };
// }
//
// class EmployersData {
//   EmployersData({
//     this.id,
//     this.menuActive,
//     this.pageTitle,
//   })
//
//   EmployersRows? rows;
//   String? menuActive;
//   String? pageTitle;
//
//   factory Data.fromJson()
// }