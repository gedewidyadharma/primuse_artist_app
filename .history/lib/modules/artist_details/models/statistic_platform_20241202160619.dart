// To parse this JSON data, do
//
//     final statsPlatform = statsPlatformFromJson(jsonString);

import 'dart:convert';

StatsPlatform statsPlatformFromJson(String str) => StatsPlatform.fromJson(json.decode(str));

String statsPlatformToJson(StatsPlatform data) => json.encode(data.toJson());

class StatsPlatform {
    int? id;
    String? name;
    Country? country;
    List<String>? statsIds;
    HistoryStats? historyStats;

    StatsPlatform({
        this.id,
        this.name,
        this.country,
        this.statsIds,
        this.historyStats,
    });

    factory StatsPlatform.fromJson(Map<String, dynamic> json) => StatsPlatform(
        id: json["id"],
        name: json["name"],
        country: json["country"] == null ? null : Country.fromJson(json["country"]),
        statsIds: json["stats_ids"] == null ? [] : List<String>.from(json["stats_ids"]!.map((x) => x)),
        historyStats: json["historyStats"] == null ? null : HistoryStats.fromJson(json["historyStats"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country?.toJson(),
        "stats_ids": statsIds == null ? [] : List<dynamic>.from(statsIds!.map((x) => x)),
        "historyStats": historyStats?.toJson(),
    };
}

class Country {
    String? name;
    String? iso2;

    Country({
        this.name,
        this.iso2,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        iso2: json["iso2"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "iso2": iso2,
    };
}

class HistoryStats {
    String? from;
    String? to;
    List<Datum>? data;

    HistoryStats({
        this.from,
        this.to,
        this.data,
    });

    factory HistoryStats.fromJson(Map<String, dynamic> json) => HistoryStats(
        from: json["from"],
        to: json["to"] ,
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? source;
    Data? data;

    Datum({
        this.source,
        this.data,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        source: json["source"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "source": source,
        "data": data?.toJson(),
    };
}

class Data {
    List<History>? history;

    Data({
        this.history,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        history: json["history"] == null ? [] : List<History>.from(json["history"]!.map((x) => History.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "history": history == null ? [] : List<dynamic>.from(history!.map((x) => x.toJson())),
    };
}

class History {
    DateTime? date;
    int? popularityCurrent;
    int? followersTotal;
    int? monthlyListenersCurrent;
    int? streamsTotal;

    History({
        this.date,
        this.popularityCurrent,
        this.followersTotal,
        this.monthlyListenersCurrent,
        this.streamsTotal,
    });

    factory History.fromJson(Map<String, dynamic> json) => History(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        popularityCurrent: json["popularity_current"],
        followersTotal: json["followers_total"],
        monthlyListenersCurrent: json["monthly_listeners_current"],
        streamsTotal: json["streams_total"],
    );

    Map<String, dynamic> toJson() => {
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "popularity_current": popularityCurrent,
        "followers_total": followersTotal,
        "monthly_listeners_current": monthlyListenersCurrent,
        "streams_total": streamsTotal,
    };
}
