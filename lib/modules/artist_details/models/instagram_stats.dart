// To parse this JSON data, do
//
//     final instagramStats = instagramStatsFromJson(jsonString);

import 'dart:convert';

import 'models.dart';

InstagramStats instagramStatsFromJson(String str) => InstagramStats.fromJson(json.decode(str));

String instagramStatsToJson(InstagramStats data) => json.encode(data.toJson());

class InstagramStats {
    int? id;
    String? name;
    CountryNameIso? country;
    List<String>? statsIds;
    _HistoryStats? historyStats;

    InstagramStats({
        this.id,
        this.name,
        this.country,
        this.statsIds,
        this.historyStats,
    });

    factory InstagramStats.fromJson(Map<String, dynamic> json) => InstagramStats(
        id: json["id"],
        name: json["name"],
        country: json["country"] == null ? null : CountryNameIso.fromJson(json["country"]),
        statsIds: json["stats_ids"] == null ? [] : List<String>.from(json["stats_ids"]!.map((x) => x)),
        historyStats: json["historyStats"] == null ? null : _HistoryStats.fromJson(json["historyStats"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country?.toJson(),
        "stats_ids": statsIds == null ? [] : List<dynamic>.from(statsIds!.map((x) => x)),
        "historyStats": historyStats?.toJson(),
    };
}

class _HistoryStats {
    DateTime? from;
    DateTime? to;
    List<_Datum>? data;

    _HistoryStats({
        this.from,
        this.to,
        this.data,
    });

    factory _HistoryStats.fromJson(Map<String, dynamic> json) => _HistoryStats(
        from: json["from"] == null ? null : DateTime.parse(json["from"]),
        to: json["to"] == null ? null : DateTime.parse(json["to"]),
        data: json["data"] == null ? [] : List<_Datum>.from(json["data"]!.map((x) => _Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "from": "${from!.year.toString().padLeft(4, '0')}-${from!.month.toString().padLeft(2, '0')}-${from!.day.toString().padLeft(2, '0')}",
        "to": "${to!.year.toString().padLeft(4, '0')}-${to!.month.toString().padLeft(2, '0')}-${to!.day.toString().padLeft(2, '0')}",
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class _Datum {
    String? source;
    _Data? data;

    _Datum({
        this.source,
        this.data,
    });

    factory _Datum.fromJson(Map<String, dynamic> json) => _Datum(
        source: json["source"],
        data: json["data"] == null ? null : _Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "source": source,
        "data": data?.toJson(),
    };
}

class _Data {
    List<InstagramStatsHistories>? history;

    _Data({
        this.history,
    });

    factory _Data.fromJson(Map<String, dynamic> json) => _Data(
        history: json["history"] == null ? [] : List<InstagramStatsHistories>.from(json["history"]!.map((x) => InstagramStatsHistories.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "history": history == null ? [] : List<dynamic>.from(history!.map((x) => x.toJson())),
    };
}

class InstagramStatsHistories {
    DateTime? date;
    int? followersTotal;

    InstagramStatsHistories({
        this.date,
        this.followersTotal,
    });

    factory InstagramStatsHistories.fromJson(Map<String, dynamic> json) => InstagramStatsHistories(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        followersTotal: json["followers_total"],
    );

    Map<String, dynamic> toJson() => {
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "followers_total": followersTotal,
    };
}
