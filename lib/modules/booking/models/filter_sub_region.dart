// To parse this JSON data, do
//
//     final filterSubRegion = filterSubRegionFromJson(jsonString);

import 'dart:convert';

List<FilterSubRegion> filterSubRegionFromJson(String str) => List<FilterSubRegion>.from(json.decode(str).map((x) => FilterSubRegion.fromJson(x)));

String filterSubRegionToJson(List<FilterSubRegion> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FilterSubRegion {
    String? id;
    String? name;
    String? iso2;

    FilterSubRegion({
        this.id,
        this.name,
        this.iso2,
    });

    factory FilterSubRegion.fromJson(Map<String, dynamic> json) => FilterSubRegion(
        id: json["_id"],
        name: json["name"],
        iso2: json["iso2"],

    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "iso2": iso2,
    };
}