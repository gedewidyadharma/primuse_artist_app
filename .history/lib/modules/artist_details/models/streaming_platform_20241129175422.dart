// To parse this JSON data, do
//
//     final streamingPlatform = streamingPlatformFromJson(jsonString);

import 'dart:convert';

StreamingPlatform streamingPlatformFromJson(String str) => StreamingPlatform.fromJson(json.decode(str));

String streamingPlatformToJson(StreamingPlatform data) => json.encode(data.toJson());

class StreamingPlatform {
    int? id;
    String? name;
    _Country? country;
    List<String>? statsIds;
    Map<String, dynamic>? stats;

    StreamingPlatform({
        this.id,
        this.name,
        this.country,
        this.statsIds,
        this.stats,
    });

    factory StreamingPlatform.fromJson(Map<String, dynamic> json) => StreamingPlatform(
        id: json["id"],
        name: json["name"],
        country: json["country"] == null ? null : _Country.fromJson(json["country"]),
        statsIds: json["stats_ids"] == null ? [] : List<String>.from(json["stats_ids"]!.map((x) => x)),
        stats: Map.from(json["stats"]!).map((k, v) => MapEntry<String, int>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country?.toJson(),
        "stats_ids": statsIds == null ? [] : List<dynamic>.from(statsIds!.map((x) => x)),
        "stats": Map.from(stats!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

class _Country {
    String? name;
    String? iso2;

    _Country({
        this.name,
        this.iso2,
    });

    factory _Country.fromJson(Map<String, dynamic> json) => _Country(
        name: json["name"],
        iso2: json["iso2"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "iso2": iso2,
    };
}
