// To parse this JSON data, do
//
//     final artistsDetails = artistsDetailsFromJson(jsonString);

import 'dart:convert';

ArtistDetails artistsDetailsFromJson(String str) => ArtistDetails.fromJson(json.decode(str));

String artistsDetailsToJson(ArtistDetails data) => json.encode(data.toJson());

class ArtistDetails {
    int? id;
    int? active;
    String? name;
    String? sortName;
    String? type;
    int? activeFrom;
    Country? country;
    List<String>? genres;
    String? bio;
    String? gid;
    String? website;
    Socials? socials;
    StreamingPlatforms? streamingPlatforms;
    dynamic comment;
    DateTime? updated;
    String? image;
    DataPlatforms? dataPlatforms;
    Map<String, PlatformClass?>? platforms;
    int? rank;

    ArtistDetails({
        this.id,
        this.active,
        this.name,
        this.sortName,
        this.type,
        this.activeFrom,
        this.country,
        this.genres,
        this.bio,
        this.gid,
        this.website,
        this.socials,
        this.streamingPlatforms,
        this.comment,
        this.updated,
        this.image,
        this.dataPlatforms,
        this.platforms,
        this.rank,
    });

    factory ArtistDetails.fromJson(Map<String, dynamic> json) => ArtistDetails(
        id: json["id"],
        active: json["active"],
        name: json["name"],
        sortName: json["sortName"],
        type: json["type"],
        activeFrom: json["activeFrom"],
        country: json["country"] == null ? null : Country.fromJson(json["country"]),
        genres: json["genres"] == null ? [] : List<String>.from(json["genres"]!.map((x) => x)),
        bio: json["bio"],
        gid: json["gid"],
        website: json["website"],
        socials: json["socials"] == null ? null : Socials.fromJson(json["socials"]),
        streamingPlatforms: json["streamingPlatforms"] == null ? null : StreamingPlatforms.fromJson(json["streamingPlatforms"]),
        comment: json["comment"],
        updated: json["updated"] == null ? null : DateTime.parse(json["updated"]),
        image: json["image"],
        dataPlatforms: json["data_platforms"] == null ? null : DataPlatforms.fromJson(json["data_platforms"]),
        platforms: Map.from(json["platforms"]!).map((k, v) => MapEntry<String, PlatformClass?>(k, v == null ? null : PlatformClass.fromJson(v))),
        rank: json["rank"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "name": name,
        "sortName": sortName,
        "type": type,
        "activeFrom": activeFrom,
        "country": country?.toJson(),
        "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x)),
        "bio": bio,
        "gid": gid,
        "website": website,
        "socials": socials?.toJson(),
        "streamingPlatforms": streamingPlatforms?.toJson(),
        "comment": comment,
        "updated": updated?.toIso8601String(),
        "image": image,
        "data_platforms": dataPlatforms?.toJson(),
        "platforms": Map.from(platforms!).map((k, v) => MapEntry<String, dynamic>(k, v?.toJson())),
        "rank": rank,
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

class DataPlatforms {
    String? vibrateUuid;
    String? songstatsId;

    DataPlatforms({
        this.vibrateUuid,
        this.songstatsId,
    });

    factory DataPlatforms.fromJson(Map<String, dynamic> json) => DataPlatforms(
        vibrateUuid: json["vibrate_uuid"],
        songstatsId: json["songstats_id"],
    );

    Map<String, dynamic> toJson() => {
        "vibrate_uuid": vibrateUuid,
        "songstats_id": songstatsId,
    };
}

class PlatformClass {
    String? id;
    String? url;
    String? platform;

    PlatformClass({
        this.id,
        this.url,
        this.platform,
    });

    factory PlatformClass.fromJson(Map<String, dynamic> json) => PlatformClass(
        id: json["id"],
        url: json["url"],
        platform: json["platform"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "platform": platform,
    };
}

class Socials {
    String? twitter;
    String? instagram;
    String? facebook;
    String? genius;
    String? lastfm;
    dynamic songkick;

    Socials({
        this.twitter,
        this.instagram,
        this.facebook,
        this.genius,
        this.lastfm,
        this.songkick,
    });

    factory Socials.fromJson(Map<String, dynamic> json) => Socials(
        twitter: json["twitter"],
        instagram: json["instagram"],
        facebook: json["facebook"],
        genius: json["genius"],
        lastfm: json["lastfm"],
        songkick: json["songkick"],
    );

    Map<String, dynamic> toJson() => {
        "twitter": twitter,
        "instagram": instagram,
        "facebook": facebook,
        "genius": genius,
        "lastfm": lastfm,
        "songkick": songkick,
    };
}

class StreamingPlatforms {
    String? deezer;
    String? soundcloud;
    String? spotify;
    String? shazam;
    dynamic youtube;
    String? netease;
    String? qq;
    dynamic kuwo;
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
