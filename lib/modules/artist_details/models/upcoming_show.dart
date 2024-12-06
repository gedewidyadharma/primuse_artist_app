// To parse this JSON data, do
//
//     final upcomingShow = upcomingShowFromJson(jsonString);

import 'dart:convert';

List<UpcomingShow> upcomingShowFromJson(String str) => List<UpcomingShow>.from(json.decode(str).map((x) => UpcomingShow.fromJson(x)));

String upcomingShowToJson(List<UpcomingShow> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UpcomingShow {
    String? id;
    String? url;
    DateTime? datetime;
    String? title;
    String? description;
    Venue? venue;
    List<String>? lineup;
    List<Offer>? offers;
    bool? free;
    String? artistId;
    String? onSaleDatetime;
    String? festivalStartDate;
    String? festivalEndDate;
    String? festivalDatetimeDisplayRule;
    DateTime? startsAt;
    String? endsAt;
    String? datetimeDisplayRule;
    bool? bandsintownPlus;
    String? presale;
    bool? soldOut;

    UpcomingShow({
        this.id,
        this.url,
        this.datetime,
        this.title,
        this.description,
        this.venue,
        this.lineup,
        this.offers,
        this.free,
        this.artistId,
        this.onSaleDatetime,
        this.festivalStartDate,
        this.festivalEndDate,
        this.festivalDatetimeDisplayRule,
        this.startsAt,
        this.endsAt,
        this.datetimeDisplayRule,
        this.bandsintownPlus,
        this.presale,
        this.soldOut,
    });

    factory UpcomingShow.fromJson(Map<String, dynamic> json) => UpcomingShow(
        id: json["id"],
        url: json["url"],
        datetime: json["datetime"] == null ? null : DateTime.parse(json["datetime"]),
        title: json["title"],
        description: json["description"],
        venue: json["venue"] == null ? null : Venue.fromJson(json["venue"]),
        lineup: json["lineup"] == null ? [] : List<String>.from(json["lineup"]!.map((x) => x)),
        offers: json["offers"] == null ? [] : List<Offer>.from(json["offers"]!.map((x) => Offer.fromJson(x))),
        free: json["free"],
        artistId: json["artist_id"],
        onSaleDatetime: json["on_sale_datetime"],
        festivalStartDate: json["festival_start_date"],
        festivalEndDate: json["festival_end_date"],
        festivalDatetimeDisplayRule: json["festival_datetime_display_rule"],
        startsAt: json["starts_at"] == null ? null : DateTime.parse(json["starts_at"]),
        endsAt: json["ends_at"],
        datetimeDisplayRule: json["datetime_display_rule"],
        bandsintownPlus: json["bandsintown_plus"],
        presale: json["presale"],
        soldOut: json["sold_out"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "datetime": datetime?.toIso8601String(),
        "title": title,
        "description": description,
        "venue": venue?.toJson(),
        "lineup": lineup == null ? [] : List<dynamic>.from(lineup!.map((x) => x)),
        "offers": offers == null ? [] : List<dynamic>.from(offers!.map((x) => x.toJson())),
        "free": free,
        "artist_id": artistId,
        "on_sale_datetime": onSaleDatetime,
        "festival_start_date": festivalStartDate,
        "festival_end_date": festivalEndDate,
        "festival_datetime_display_rule": festivalDatetimeDisplayRule,
        "starts_at": startsAt?.toIso8601String(),
        "ends_at": endsAt,
        "datetime_display_rule": datetimeDisplayRule,
        "bandsintown_plus": bandsintownPlus,
        "presale": presale,
        "sold_out": soldOut,
    };
}

class Offer {
    String? type;
    String? url;
    String? status;

    Offer({
        this.type,
        this.url,
        this.status,
    });

    factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        type: json["type"],
        url: json["url"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
        "status": status,
    };
}

class Venue {
    String? location;
    String? name;
    String? latitude;
    String? longitude;
    String? streetAddress;
    String? postalCode;
    String? city;
    String? country;
    String? region;

    Venue({
        this.location,
        this.name,
        this.latitude,
        this.longitude,
        this.streetAddress,
        this.postalCode,
        this.city,
        this.country,
        this.region,
    });

    factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        location: json["location"],
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        streetAddress: json["street_address"],
        postalCode: json["postal_code"],
        city: json["city"],
        country: json["country"],
        region: json["region"],
    );

    Map<String, dynamic> toJson() => {
        "location": location,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "street_address": streetAddress,
        "postal_code": postalCode,
        "city": city,
        "country": country,
        "region": region,
    };
}
