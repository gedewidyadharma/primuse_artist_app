// To parse this JSON data, do
//
//     final statsPlatform = statsPlatformFromJson(jsonString);

import 'dart:convert';

import 'models.dart';

SpotifyStats spotifyStatsFromJson(String str) => SpotifyStats.fromJson(json.decode(str));

String spotifyStatsToJson(SpotifyStats data) => json.encode(data.toJson());

class SpotifyStats {
    int? id;
    String? name;
    CountryNameIso? country;
    List<String>? statsIds;
    _HistoryStats? historyStats;

    SpotifyStats({
        this.id,
        this.name,
        this.country,
        this.statsIds,
        this.historyStats,
    });

    factory SpotifyStats.fromJson(Map<String, dynamic> json) => SpotifyStats(
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
    String? from;
    String? to;
    List<_Datum>? data;

    _HistoryStats({
        this.from,
        this.to,
        this.data,
    });

    factory _HistoryStats.fromJson(Map<String, dynamic> json) => _HistoryStats(
        from: json["from"],
        to: json["to"] ,
        data: json["data"] == null ? [] : List<_Datum>.from(json["data"]!.map((x) => _Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
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
    List<SpotifyStatsHistories>? history;

    _Data({
        this.history,
    });

    factory _Data.fromJson(Map<String, dynamic> json) => _Data(
        history: json["history"] == null ? [] : List<SpotifyStatsHistories>.from(json["history"]!.map((x) => SpotifyStatsHistories.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "history": history == null ? [] : List<dynamic>.from(history!.map((x) => x.toJson())),
    };
}

class SpotifyStatsHistories{
    DateTime? date;
    int? popularityCurrent;
    int? followersTotal;
    int? monthlyListenersCurrent;
    int? streamsTotal;

    SpotifyStatsHistories({
        this.date,
        this.popularityCurrent,
        this.followersTotal,
        this.monthlyListenersCurrent,
        this.streamsTotal,
    });

    factory SpotifyStatsHistories.fromJson(Map<String, dynamic> json) => SpotifyStatsHistories(
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
