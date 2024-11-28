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
        continent: json["continent"] == null ? null : Continent.fromJson(json["continent"]),
        flag: json["flag"] == null ? null : Flag.fromJson(json["flag"]),
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
        currency: json["currency"] == null ? null : FilterSubRegionCurrency.fromJson(json["currency"]),
        phonePrefix: json["phone_prefix"],
        defaultLocale: json["default_locale"],
        locales: json["locales"] == null ? [] : List<String>.from(json["locales"]!.map((x) => x)),
        languages: json["languages"] == null ? [] : List<String>.from(json["languages"]!.map((x) => x)),
        population: json["population"],
        taxes: json["taxes"] == null ? null : Taxes.fromJson(json["taxes"]),
        mainMarket: json["mainMarket"],
        coordinates: json["coordinates"] == null ? null : Coordinates.fromJson(json["coordinates"]),
        nationality: json["nationality"],
        regions: json["regions"] == null ? null : Regions.fromJson(json["regions"]),
        timezones: json["timezones"] == null ? [] : List<Timezone>.from(json["timezones"]!.map((x) => Timezone.fromJson(x))),
        tld: json["tld"],
        translations: json["translations"] == null ? null : Translations.fromJson(json["translations"]),
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
    );

    Map<String, dynamic> toJson() => {
        "continent": continent?.toJson(),
        "flag": flag?.toJson(),
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
        "currency": currency?.toJson(),
        "phone_prefix": phonePrefix,
        "default_locale": defaultLocale,
        "locales": locales == null ? [] : List<dynamic>.from(locales!.map((x) => x)),
        "languages": languages == null ? [] : List<dynamic>.from(languages!.map((x) => x)),
        "population": population,
        "taxes": taxes?.toJson(),
        "mainMarket": mainMarket,
        "coordinates": coordinates?.toJson(),
        "nationality": nationality,
        "regions": regions?.toJson(),
        "timezones": timezones == null ? [] : List<dynamic>.from(timezones!.map((x) => x.toJson())),
        "tld": tld,
        "translations": translations?.toJson(),
        "location": location?.toJson(),
    };
}


class Location {
    Country? country;

    Location({
        this.country,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        country: json["country"] == null ? null : Country.fromJson(json["country"]),
    );

    Map<String, dynamic> toJson() => {
        "country": country?.toJson(),
    };
}

class Country {
    int? id;
    String? iso;
    String? name;

    Country({
        this.id,
        this.iso,
        this.name,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        iso: json["iso"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "iso": iso,
        "name": name,
    };
}
