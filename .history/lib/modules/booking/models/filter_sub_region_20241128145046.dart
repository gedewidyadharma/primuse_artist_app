// To parse this JSON data, do
//
//     final filterSubRegion = filterSubRegionFromJson(jsonString);

import 'dart:convert';

List<FilterSubRegion> filterSubRegionFromJson(String str) => List<FilterSubRegion>.from(json.decode(str).map((x) => FilterSubRegion.fromJson(x)));

String filterSubRegionToJson(List<FilterSubRegion> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FilterSubRegion {
    String? id;
    String? filterSubRegionId;
    String? name;
    String? native;
    String? iso2;
    String? iso3;
    String? numeric;
    String? fips;
    String? numericIso;
    String? capital;
    String? phonePrefix;
    String? defaultLocale;

    FilterSubRegion({
        this.id,
        this.filterSubRegionId,
        this.name,
        this.native,
        this.iso2,
        this.iso3,
        this.numeric,
        this.fips,
        this.numericIso,
        this.capital,
        this.phonePrefix,
        this.defaultLocale,
    });

    factory FilterSubRegion.fromJson(Map<String, dynamic> json) => FilterSubRegion(
        id: json["_id"],
        filterSubRegionId: json["id"],
        name: json["name"],
        native: json["native"],
        iso2: json["iso2"],
        iso3: json["iso3"],
        numeric: json["numeric"],
        fips: json["fips"],
        numericIso: json["numeric_iso"],
        capital: json["capital"],
        phonePrefix: json["phone_prefix"],
        defaultLocale: json["default_locale"],

    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "id": filterSubRegionId,
        "name": name,
        "native": native,
        "iso2": iso2,
        "iso3": iso3,
        "numeric": numeric,
        "fips": fips,
        "numeric_iso": numericIso,
        "capital": capital,
        "phone_prefix": phonePrefix,
        "default_locale": defaultLocale,
    };
}