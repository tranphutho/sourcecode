// To parse this JSON data, do
//
//     final getApplicants = getApplicantsFromJson(jsonString);

import 'dart:convert';

GetApplicants getApplicantsFromJson(String str) =>
    GetApplicants.fromJson(json.decode(str));

String getApplicantsToJson(GetApplicants data) => json.encode(data.toJson());

class GetApplicants {
  GetApplicants({
    this.status,
    this.data,
  });

  bool? status;
  Data? data;

  factory GetApplicants.fromJson(Map<String, dynamic> json) => GetApplicants(
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
    this.rows,
    this.menuActive,
    this.pageTitle,
  });

  Rows? rows;
  String? menuActive;
  String? pageTitle;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        rows: json["rows"] == null ? null : Rows.fromJson(json["rows"]),
        menuActive: json["menu_active"] == null ? null : json["menu_active"],
        pageTitle: json["page_title"] == null ? null : json["page_title"],
      );

  Map<String, dynamic> toJson() => {
        "rows": rows == null ? null : rows!.toJson(),
        "menu_active": menuActive == null ? null : menuActive,
        "page_title": pageTitle == null ? null : pageTitle,
      };
}

class Rows {
  Rows({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<dynamic>? data;
  String? firstPageUrl;
  dynamic from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  dynamic to;
  int? total;

  factory Rows.fromJson(Map<String, dynamic> json) => Rows(
        currentPage: json["current_page"] == null ? null : json["current_page"],
        data: json["data"] == null
            ? null
            : List<dynamic>.from(json["data"].map((x) => x)),
        firstPageUrl:
            json["first_page_url"] == null ? null : json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"] == null ? null : json["last_page"],
        lastPageUrl:
            json["last_page_url"] == null ? null : json["last_page_url"],
        links: json["links"] == null
            ? null
            : List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"] == null ? null : json["path"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"] == null ? null : json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage == null ? null : currentPage,
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x)),
        "first_page_url": firstPageUrl == null ? null : firstPageUrl,
        "from": from,
        "last_page": lastPage == null ? null : lastPage,
        "last_page_url": lastPageUrl == null ? null : lastPageUrl,
        "links": links == null
            ? null
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path == null ? null : path,
        "per_page": perPage == null ? null : perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total == null ? null : total,
      };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"] == null ? null : json["label"],
        active: json["active"] == null ? null : json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label == null ? null : label,
        "active": active == null ? null : active,
      };
}
