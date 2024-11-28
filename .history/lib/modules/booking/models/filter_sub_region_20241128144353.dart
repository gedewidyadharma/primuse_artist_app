// To parse this JSON data, do
//
//     final filterSubRegion = filterSubRegionFromJson(jsonString);

import 'dart:convert';

List<FilterSubRegion> filterSubRegionFromJson(String str) => List<FilterSubRegion>.from(json.decode(str).map((x) => FilterSubRegion.fromJson(x)));

String filterSubRegionToJson(List<FilterSubRegion> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FilterSubRegion {
    Continent? continent;
    Flag? flag;
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
    FilterSubRegionCurrency? currency;
    String? phonePrefix;
    String? defaultLocale;
    List<String>? locales;
    List<String>? languages;
    String? population;
    Taxes? taxes;
    int? mainMarket;
    Coordinates? coordinates;
    String? nationality;
    Regions? regions;
    List<Timezone>? timezones;
    String? tld;
    Translations? translations;
    Location? location;

    FilterSubRegion({
        this.continent,
        this.flag,
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
        this.currency,
        this.phonePrefix,
        this.defaultLocale,
        this.locales,
        this.languages,
        this.population,
        this.taxes,
        this.mainMarket,
        this.coordinates,
        this.nationality,
        this.regions,
        this.timezones,
        this.tld,
        this.translations,
        this.location,
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

class Continent {
    String? name;
    String? code;
    String? region;

    Continent({
        this.name,
        this.code,
        this.region,
    });

    factory Continent.fromJson(Map<String, dynamic> json) => Continent(
        name: json["name"],
        code: json["code"],
        region: json["region"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "region": region,
    };
}

class Coordinates {
    String? latitude;
    String? longitude;

    Coordinates({
        this.latitude,
        this.longitude,
    });

    factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"],
        longitude: json["longitude"],
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}

class FilterSubRegionCurrency {
    String? name;
    String? code;
    String? symbol;
    List<String>? symbolDecimal;
    List<String>? symbolHex;
    String? symbolNative;
    String? symbolPosition;
    int? decimalDigits;
    dynamic rounding;
    String? namePlural;

    FilterSubRegionCurrency({
        this.name,
        this.code,
        this.symbol,
        this.symbolDecimal,
        this.symbolHex,
        this.symbolNative,
        this.symbolPosition,
        this.decimalDigits,
        this.rounding,
        this.namePlural,
    });

    factory FilterSubRegionCurrency.fromJson(Map<String, dynamic> json) => FilterSubRegionCurrency(
        name: json["name"],
        code: json["code"],
        symbol: json["symbol"],
        symbolDecimal: json["symbol_decimal"] == null ? [] : List<String>.from(json["symbol_decimal"]!.map((x) => x)),
        symbolHex: json["symbol_hex"] == null ? [] : List<String>.from(json["symbol_hex"]!.map((x) => x)),
        symbolNative: json["symbol_native"],
        symbolPosition: json["symbol_position"],
        decimalDigits: json["decimal_digits"],
        rounding: json["rounding"],
        namePlural: json["name_plural"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "symbol": symbol,
        "symbol_decimal": symbolDecimal == null ? [] : List<dynamic>.from(symbolDecimal!.map((x) => x)),
        "symbol_hex": symbolHex == null ? [] : List<dynamic>.from(symbolHex!.map((x) => x)),
        "symbol_native": symbolNative,
        "symbol_position": symbolPosition,
        "decimal_digits": decimalDigits,
        "rounding": rounding,
        "name_plural": namePlural,
    };
}

class Flag {
    FlagCurrency? currency;
    String? code;
    String? unicode;
    String? name;
    String? emoji;

    Flag({
        this.currency,
        this.code,
        this.unicode,
        this.name,
        this.emoji,
    });

    factory Flag.fromJson(Map<String, dynamic> json) => Flag(
        currency: json["currency"] == null ? null : FlagCurrency.fromJson(json["currency"]),
        code: json["code"],
        unicode: json["unicode"],
        name: json["name"],
        emoji: json["emoji"],
    );

    Map<String, dynamic> toJson() => {
        "currency": currency?.toJson(),
        "code": code,
        "unicode": unicode,
        "name": name,
        "emoji": emoji,
    };
}

class FlagCurrency {
    List<dynamic>? symbolDecimal;
    List<dynamic>? symbolHex;
    List<dynamic>? locales;
    List<dynamic>? languages;

    FlagCurrency({
        this.symbolDecimal,
        this.symbolHex,
        this.locales,
        this.languages,
    });

    factory FlagCurrency.fromJson(Map<String, dynamic> json) => FlagCurrency(
        symbolDecimal: json["symbol_decimal"] == null ? [] : List<dynamic>.from(json["symbol_decimal"]!.map((x) => x)),
        symbolHex: json["symbol_hex"] == null ? [] : List<dynamic>.from(json["symbol_hex"]!.map((x) => x)),
        locales: json["locales"] == null ? [] : List<dynamic>.from(json["locales"]!.map((x) => x)),
        languages: json["languages"] == null ? [] : List<dynamic>.from(json["languages"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "symbol_decimal": symbolDecimal == null ? [] : List<dynamic>.from(symbolDecimal!.map((x) => x)),
        "symbol_hex": symbolHex == null ? [] : List<dynamic>.from(symbolHex!.map((x) => x)),
        "locales": locales == null ? [] : List<dynamic>.from(locales!.map((x) => x)),
        "languages": languages == null ? [] : List<dynamic>.from(languages!.map((x) => x)),
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

class Regions {
    String? region;
    String? regionId;
    String? subregion;
    String? subregionId;

    Regions({
        this.region,
        this.regionId,
        this.subregion,
        this.subregionId,
    });

    factory Regions.fromJson(Map<String, dynamic> json) => Regions(
        region: json["region"],
        regionId: json["region_id"],
        subregion: json["subregion"],
        subregionId: json["subregion_id"],
    );

    Map<String, dynamic> toJson() => {
        "region": region,
        "region_id": regionId,
        "subregion": subregion,
        "subregion_id": subregionId,
    };
}

class Taxes {
    String? type;
    String? typeCode;
    double? rate;
    String? rateString;
    String? rateType;
    String? description;
    String? typeName;

    Taxes({
        this.type,
        this.typeCode,
        this.rate,
        this.rateString,
        this.rateType,
        this.description,
        this.typeName,
    });

    factory Taxes.fromJson(Map<String, dynamic> json) => Taxes(
        type: json["type"],
        typeCode: json["type_code"],
        rate: json["rate"]?.toDouble(),
        rateString: json["rate_string"],
        rateType: json["rate_type"],
        description: json["description"],
        typeName: json["type_name"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "type_code": typeCode,
        "rate": rate,
        "rate_string": rateString,
        "rate_type": rateType,
        "description": description,
        "type_name": typeName,
    };
}

class Timezone {
    String? zoneName;
    int? gmtOffset;
    String? gmtOffsetName;
    String? abbreviation;
    String? tzName;

    Timezone({
        this.zoneName,
        this.gmtOffset,
        this.gmtOffsetName,
        this.abbreviation,
        this.tzName,
    });

    factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        zoneName: json["zoneName"],
        gmtOffset: json["gmtOffset"],
        gmtOffsetName: json["gmtOffsetName"],
        abbreviation: json["abbreviation"],
        tzName: json["tzName"],
    );

    Map<String, dynamic> toJson() => {
        "zoneName": zoneName,
        "gmtOffset": gmtOffset,
        "gmtOffsetName": gmtOffsetName,
        "abbreviation": abbreviation,
        "tzName": tzName,
    };
}

class Translations {
    String? kr;
    String? ptBr;
    String? pt;
    String? nl;
    String? hr;
    String? fa;
    String? de;
    String? es;
    String? fr;
    String? ja;
    String? it;
    String? cn;
    String? tr;

    Translations({
        this.kr,
        this.ptBr,
        this.pt,
        this.nl,
        this.hr,
        this.fa,
        this.de,
        this.es,
        this.fr,
        this.ja,
        this.it,
        this.cn,
        this.tr,
    });

    factory Translations.fromJson(Map<String, dynamic> json) => Translations(
        kr: json["kr"],
        ptBr: json["pt-BR"],
        pt: json["pt"],
        nl: json["nl"],
        hr: json["hr"],
        fa: json["fa"],
        de: json["de"],
        es: json["es"],
        fr: json["fr"],
        ja: json["ja"],
        it: json["it"],
        cn: json["cn"],
        tr: json["tr"],
    );

    Map<String, dynamic> toJson() => {
        "kr": kr,
        "pt-BR": ptBr,
        "pt": pt,
        "nl": nl,
        "hr": hr,
        "fa": fa,
        "de": de,
        "es": es,
        "fr": fr,
        "ja": ja,
        "it": it,
        "cn": cn,
        "tr": tr,
    };
}
