// To parse this JSON data, do
//
//     final statsAudience = statsAudienceFromJson(jsonString);

import 'dart:convert';

StatsAudience statsAudienceFromJson(String str) => StatsAudience.fromJson(json.decode(str));

String statsAudienceToJson(StatsAudience data) => json.encode(data.toJson());

class StatsAudience {
    int? id;
    String? name;
    StatsAudienceCountry? country;
    List<String>? statsIds;
    List<Audience>? audience;

    StatsAudience({
        this.id,
        this.name,
        this.country,
        this.statsIds,
        this.audience,
    });

    factory StatsAudience.fromJson(Map<String, dynamic> json) => StatsAudience(
        id: json["id"],
        name: json["name"],
        country: json["country"] == null ? null : StatsAudienceCountry.fromJson(json["country"]),
        statsIds: json["stats_ids"] == null ? [] : List<String>.from(json["stats_ids"]!.map((x) => x)),
        audience: json["audience"] == null ? [] : List<Audience>.from(json["audience"]!.map((x) => Audience.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country?.toJson(),
        "stats_ids": statsIds == null ? [] : List<dynamic>.from(statsIds!.map((x) => x)),
        "audience": audience == null ? [] : List<dynamic>.from(audience!.map((x) => x.toJson())),
    };
}

class Audience {
    String? source;
    Data? data;

    Audience({
        this.source,
        this.data,
    });

    factory Audience.fromJson(Map<String, dynamic> json) => Audience(
        source: json["source"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "source": source,
        "data": data?.toJson(),
    };
}

class Data {
    List<MonthlyListener>? monthlyListeners;
    List<CityChart>? cityCharts;
    List<CountryChart>? countryCharts;

    Data({
        this.monthlyListeners,
        this.cityCharts,
        this.countryCharts,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        monthlyListeners: json["monthly_listeners"] == null ? [] : List<MonthlyListener>.from(json["monthly_listeners"]!.map((x) => MonthlyListener.fromJson(x))),
        cityCharts: json["city_charts"] == null ? [] : List<CityChart>.from(json["city_charts"]!.map((x) => CityChart.fromJson(x))),
        countryCharts: json["country_charts"] == null ? [] : List<CountryChart>.from(json["country_charts"]!.map((x) => CountryChart.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "monthly_listeners": monthlyListeners == null ? [] : List<dynamic>.from(monthlyListeners!.map((x) => x.toJson())),
        "city_charts": cityCharts == null ? [] : List<dynamic>.from(cityCharts!.map((x) => x.toJson())),
        "country_charts": countryCharts == null ? [] : List<dynamic>.from(countryCharts!.map((x) => x.toJson())),
    };
}

class CityChart {
    String? countryCode;
    String? cityName;
    String? cityRegion;
    double? cityLat;
    double? cityLng;
    int? chartedTracksCurrent;
    int? chartedTracksTotal;
    int? rank;
    CityChartCountry? country;

    CityChart({
        this.countryCode,
        this.cityName,
        this.cityRegion,
        this.cityLat,
        this.cityLng,
        this.chartedTracksCurrent,
        this.chartedTracksTotal,
        this.rank,
        this.country,
    });

    factory CityChart.fromJson(Map<String, dynamic> json) => CityChart(
        countryCode: json["country_code"],
        cityName: json["city_name"],
        cityRegion: json["city_region"],
        cityLat: json["city_lat"]?.toDouble(),
        cityLng: json["city_lng"]?.toDouble(),
        chartedTracksCurrent: json["charted_tracks_current"],
        chartedTracksTotal: json["charted_tracks_total"],
        rank: json["rank"],
        country: json["country"] == null ? null : CityChartCountry.fromJson(json["country"]),
    );

    Map<String, dynamic> toJson() => {
        "country_code": countryCode,
        "city_name": cityName,
        "city_region": cityRegion,
        "city_lat": cityLat,
        "city_lng": cityLng,
        "charted_tracks_current": chartedTracksCurrent,
        "charted_tracks_total": chartedTracksTotal,
        "rank": rank,
        "country": country?.toJson(),
    };
}

class CityChartCountry {
    _Flag? flag;
    String? name;
    String? iso2;
    String? iso3;

    CityChartCountry({
        this.flag,
        this.name,
        this.iso2,
        this.iso3,
    });

    factory CityChartCountry.fromJson(Map<String, dynamic> json) => CityChartCountry(
        flag: json["flag"] == null ? null : _Flag.fromJson(json["flag"]),
        name: json["name"],
        iso2: json["iso2"],
        iso3: json["iso3"],
    );

    Map<String, dynamic> toJson() => {
        "flag": flag?.toJson(),
        "name": name,
        "iso2": iso2,
        "iso3": iso3,
    };
}

class _Flag {
    Currency? currency;
    String? code;
    String? unicode;
    String? name;
    String? emoji;

    _Flag({
        this.currency,
        this.code,
        this.unicode,
        this.name,
        this.emoji,
    });

    factory _Flag.fromJson(Map<String, dynamic> json) => _Flag(
        currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
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

class Currency {
    List<dynamic>? symbolDecimal;
    List<dynamic>? symbolHex;
    List<dynamic>? locales;
    List<dynamic>? languages;

    Currency({
        this.symbolDecimal,
        this.symbolHex,
        this.locales,
        this.languages,
    });

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
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

class CountryChart {
    String? countryCode;
    int? chartedTracksCurrent;
    int? chartedTracksTotal;
    int? rank;
    CityChartCountry? country;

    CountryChart({
        this.countryCode,
        this.chartedTracksCurrent,
        this.chartedTracksTotal,
        this.rank,
        this.country,
    });

    factory CountryChart.fromJson(Map<String, dynamic> json) => CountryChart(
        countryCode: json["country_code"],
        chartedTracksCurrent: json["charted_tracks_current"],
        chartedTracksTotal: json["charted_tracks_total"],
        rank: json["rank"],
        country: json["country"] == null ? null : CityChartCountry.fromJson(json["country"]),
    );

    Map<String, dynamic> toJson() => {
        "country_code": countryCode,
        "charted_tracks_current": chartedTracksCurrent,
        "charted_tracks_total": chartedTracksTotal,
        "rank": rank,
        "country": country?.toJson(),
    };
}

class MonthlyListener {
    String? countryCode;
    String? cityName;
    int? currentListeners;
    int? peakListeners;
    String? peakDate;
    String? cityRegion;
    String? cityLat;
    String? cityLng;
    CityChartCountry? country;
    int? rank;

    MonthlyListener({
        this.countryCode,
        this.cityName,
        this.currentListeners,
        this.peakListeners,
        this.peakDate,
        this.cityRegion,
        this.cityLat,
        this.cityLng,
        this.country,
        this.rank,
    });

    factory MonthlyListener.fromJson(Map<String, dynamic> json) => MonthlyListener(
        countryCode: json["country_code"],
        cityName: json["city_name"],
        currentListeners: json["current_listeners"],
        peakListeners: json["peak_listeners"],
        peakDate: json["peak_date"],
        cityRegion: json["city_region"],
        cityLat: json["city_lat"],
        cityLng: json["city_lng"],
        country: json["country"] == null ? null : CityChartCountry.fromJson(json["country"]),
        rank: json["rank"],
    );

    Map<String, dynamic> toJson() => {
        "country_code": countryCode,
        "city_name": cityName,
        "current_listeners": currentListeners,
        "peak_listeners": peakListeners,
        "peak_date": peakDate,
        "city_region": cityRegion,
        "city_lat": cityLat,
        "city_lng": cityLng,
        "country": country?.toJson(),
        "rank": rank,
    };
}

class StatsAudienceCountry {
    String? name;
    String? iso2;

    StatsAudienceCountry({
        this.name,
        this.iso2,
    });

    factory StatsAudienceCountry.fromJson(Map<String, dynamic> json) => StatsAudienceCountry(
        name: json["name"],
        iso2: json["iso2"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "iso2": iso2,
    };
}
