// To parse this JSON data, do
//
//     final artist = artistFromJson(jsonString);

import 'dart:convert';

List<Artist> artistFromJson(String str) => List<Artist>.from(json.decode(str).map((x) => Artist.fromJson(x)));

String artistToJson(List<Artist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Artist {
    StreamingPlatforms? streamingPlatforms;
    String? id;
    List<String>? genres;
    String? image;
    String? name;
    String? sortName;
    dynamic country;

    Artist({
        this.streamingPlatforms,
        this.id,
        this.genres,
        this.image,
        this.name,
        this.sortName,
        this.country,
    });

    factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        streamingPlatforms: json["streamingPlatforms"] == null ? null : StreamingPlatforms.fromJson(json["streamingPlatforms"]),
        id: json["id"],
        genres: json["genres"] == null ? [] : List<String>.from(json["genres"]!.map((x) => x)),
        image: json["image"],
        name: json["name"],
        sortName: json["sortName"],
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "streamingPlatforms": streamingPlatforms?.toJson(),
        "id": id,
        "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x)),
        "image": image,
        "name": name,
        "sortName": sortName,
        "country": country,
    };
}

class StreamingPlatforms {
    String? deezer;
    dynamic soundcloud;
    String? spotify;
    String? shazam;
    dynamic youtube;
    String? netease;
    String? qq;
    String? kuwo;
    String? appleMusic;

    StreamingPlatforms({
        this.deezer,
        this.soundcloud,
        this.spotify,
        this.shazam,
        this.youtube,
        this.netease,
        this.qq,
        this.kuwo,
        this.appleMusic,
    });

    factory StreamingPlatforms.fromJson(Map<String, dynamic> json) => StreamingPlatforms(
        deezer: json["deezer"],
        soundcloud: json["soundcloud"],
        spotify: json["spotify"],
        shazam: json["shazam"],
        youtube: json["youtube"],
        netease: json["netease"],
        qq: json["qq"],
        kuwo: json["kuwo"],
        appleMusic: json["apple_music"],
    );

    Map<String, dynamic> toJson() => {
        "deezer": deezer,
        "soundcloud": soundcloud,
        "spotify": spotify,
        "shazam": shazam,
        "youtube": youtube,
        "netease": netease,
        "qq": qq,
        "kuwo": kuwo,
        "apple_music": appleMusic,
    };
}
