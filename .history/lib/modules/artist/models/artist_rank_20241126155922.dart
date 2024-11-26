// To parse this JSON data, do
//
//     final artistRank = artistRankFromJson(jsonString);

import 'dart:convert';

ArtistRank artistRankFromJson(String str) => ArtistRank.fromJson(json.decode(str));

String artistRankToJson(ArtistRank data) => json.encode(data.toJson());

class ArtistRank {
    DateTime? date;
    String? city;
    String? extend;
    List<Datum>? data;

    ArtistRank({
        this.date,
        this.city,
        this.extend,
        this.data,
    });

    factory ArtistRank.fromJson(Map<String, dynamic> json) => ArtistRank(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        city: json["city"],
        extend: json["extend"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "city": city,
        "extend": extend,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? artistId;
    String? artist;
    int? cityRank;
    int? extendedRank;
    Country? country;
    List<String>? genres;
    String? image;
    int? currentListeners;
    int? peakListeners;
    String? songstatsId;
    String? spotifyId;
    int? lastExtendedRank;

    Datum({
        this.artistId,
        this.artist,
        this.cityRank,
        this.extendedRank,
        this.country,
        this.genres,
        this.image,
        this.currentListeners,
        this.peakListeners,
        this.songstatsId,
        this.spotifyId,
        this.lastExtendedRank,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        artistId: json["artist_id"],
        artist: json["artist"],
        cityRank: json["city_rank"],
        extendedRank: json["extended_rank"],
        country: json["country"] == null ? null : Country.fromJson(json["country"]),
        genres: json["genres"] == null ? [] : List<String>.from(json["genres"]!.map((x) => x)),
        image: json["image"],
        currentListeners: json["current_listeners"],
        peakListeners: json["peak_listeners"],
        songstatsId: json["songstats_id"],
        spotifyId: json["spotify_id"],
        lastExtendedRank: json["last_extended_rank"],
    );

    Map<String, dynamic> toJson() => {
        "artist_id": artistId,
        "artist": artist,
        "city_rank": cityRank,
        "extended_rank": extendedRank,
        "country": country?.toJson(),
        "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x)),
        "image": image,
        "current_listeners": currentListeners,
        "peak_listeners": peakListeners,
        "songstats_id": songstatsId,
        "spotify_id": spotifyId,
        "last_extended_rank": lastExtendedRank,
    };
}

class Country {
    String? name;
    String? iso2;
    Flag? flag;

    Country({
        this.name,
        this.iso2,
        this.flag,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        iso2: json["iso2"],
        flag: json["flag"] == null ? null : Flag.fromJson(json["flag"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "iso2": iso2,
        "flag": flag?.toJson(),
    };
}

class Flag {
    String? code;
    String? unicode;
    String? name;
    String? emoji;

    Flag({
        this.code,
        this.unicode,
        this.name,
        this.emoji,
    });

    factory Flag.fromJson(Map<String, dynamic> json) => Flag(
        code: json["code"],
        unicode: json["unicode"],
        name: json["name"],
        emoji: json["emoji"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "unicode": unicode,
        "name": name,
        "emoji": emoji,
    };
}
