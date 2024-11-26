// To parse this JSON data, do
//
//     final filterRegion = filterRegionFromJson(jsonString);

import 'dart:convert';

FilterRegion filterRegionFromJson(String str) => FilterRegion.fromJson(json.decode(str));

String filterRegionToJson(FilterRegion data) => json.encode(data.toJson());

class FilterRegion {
    List<Dashboard>? dashboard;
    Avails? avails;

    FilterRegion({
        this.dashboard,
        this.avails,
    });

    factory FilterRegion.fromJson(Map<String, dynamic> json) => FilterRegion(
        dashboard: json["dashboard"] == null ? [] : List<Dashboard>.from(json["dashboard"]!.map((x) => Dashboard.fromJson(x))),
        avails: json["avails"] == null ? null : Avails.fromJson(json["avails"]),
    );

    Map<String, dynamic> toJson() => {
        "dashboard": dashboard == null ? [] : List<dynamic>.from(dashboard!.map((x) => x.toJson())),
        "avails": avails?.toJson(),
    };
}

class Avails {
    String? regionsId;
    String? subregionsId;

    Avails({
        this.regionsId,
        this.subregionsId,
    });

    factory Avails.fromJson(Map<String, dynamic> json) => Avails(
        regionsId: json["regionsId"],
        subregionsId: json["subregionsId"],
    );

    Map<String, dynamic> toJson() => {
        "regionsId": regionsId,
        "subregionsId": subregionsId,
    };
}

class Dashboard {
    String? code;
    String? name;

    Dashboard({
        this.code,
        this.name,
    });

    factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
        code: json["code"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
    };
}
