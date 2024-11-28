// To parse this JSON data, do
//
//     final artistsAvailable = artistsAvailableFromJson(jsonString);

import 'dart:convert';

List<ArtistsAvailable> artistsAvailableFromJson(String str) => List<ArtistsAvailable>.from(json.decode(str).map((x) => ArtistsAvailable.fromJson(x)));

String artistsAvailableToJson(List<ArtistsAvailable> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArtistsAvailable {
    String? id;
    int? artistsAvailableId;
    int? active;
    String? agency;
    String? artistCode;
    int? artistId;
    String? artistName;
    double? commission;
    Dates? dates;
    int? fee;
    String? image;
    List<dynamic>? offers;
    List<String>? territories;

    ArtistsAvailable({
        this.id,
        this.artistsAvailableId,
        this.active,
        this.agency,
        this.artistCode,
        this.artistId,
        this.artistName,
        this.commission,
        this.dates,
        this.fee,
        this.image,
        this.offers,
        this.territories,
    });

    factory ArtistsAvailable.fromJson(Map<String, dynamic> json) => ArtistsAvailable(
        id: json["_id"],
        artistsAvailableId: json["id"],
        active: json["active"],
        agency: agencyValues.map[json["agency"]]!,
        artistCode: json["artist_code"],
        artistId: json["artist_id"],
        artistName: json["artist_name"],
        commission: json["commission"]?.toDouble(),
        dates: json["dates"] == null ? null : Dates.fromJson(json["dates"]),
        fee: json["fee"],
        image: json["image"],
        offers: json["offers"] == null ? [] : List<dynamic>.from(json["offers"]!.map((x) => x)),
        territories: json["territories"] == null ? [] : List<String>.from(json["territories"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "id": artistsAvailableId,
        "active": active,
        "agency": agencyValues.reverse[agency],
        "artist_code": artistCode,
        "artist_id": artistId,
        "artist_name": artistName,
        "commission": commission,
        "dates": dates?.toJson(),
        "fee": fee,
        "image": image,
        "offers": offers == null ? [] : List<dynamic>.from(offers!.map((x) => x)),
        "territories": territories == null ? [] : List<dynamic>.from(territories!.map((x) => x)),
    };
}

class Dates {
    DateTime? from;
    DateTime? to;

    Dates({
        this.from,
        this.to,
    });

    factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        from: json["from"] == null ? null : DateTime.parse(json["from"]),
        to: json["to"] == null ? null : DateTime.parse(json["to"]),
    );

    Map<String, dynamic> toJson() => {
        "from": "${from!.year.toString().padLeft(4, '0')}-${from!.month.toString().padLeft(2, '0')}-${from!.day.toString().padLeft(2, '0')}",
        "to": "${to!.year.toString().padLeft(4, '0')}-${to!.month.toString().padLeft(2, '0')}-${to!.day.toString().padLeft(2, '0')}",
    };
}
