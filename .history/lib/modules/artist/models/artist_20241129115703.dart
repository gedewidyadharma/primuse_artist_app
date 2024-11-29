// To parse this JSON data, do
//
//     final artist = artistFromJson(jsonString);

import 'dart:convert';

List<Artist> artistFromJson(String str) => List<Artist>.from(json.decode(str).map((x) => Artist.fromJson(x)));

String artistToJson(List<Artist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Artist {
    String? id;
    List<String>? genres;
    String? image;
    String? name;
    String? sortName;
    dynamic country;

    Artist({
        this.id,
        this.genres,
        this.image,
        this.name,
        this.sortName,
        this.country,
    });

    factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        id: json["id"].toString(),
        genres: json["genres"] == null ? [] : List<String>.from(json["genres"]!.map((x) => x)),
        image: json["image"],
        name: json["name"],
        sortName: json["sortName"],
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x)),
        "image": image,
        "name": name,
        "sortName": sortName,
        "country": country,
    };
}
