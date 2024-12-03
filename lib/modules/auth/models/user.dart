// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    dynamic archiveReason;
    String? id;
    String? userId;
    String? email;
    String? password;
    String? firstName;
    String? lastName;
    String? avatar;
    String? phoneNumber;
    String? city;
    String? country;
    String? address;
    bool? isEmailVerified;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    String? token;
    List<String>? favoriteArtists;
    bool? isAdmin;
    int? point;
    bool? status;
    String? wallet;
    List<String>? permissions;
    String? firebaseToken;

    User({
        this.archiveReason,
        this.id,
        this.userId,
        this.email,
        this.password,
        this.firstName,
        this.lastName,
        this.avatar,
        this.phoneNumber,
        this.city,
        this.country,
        this.address,
        this.isEmailVerified,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.token,
        this.favoriteArtists,
        this.isAdmin,
        this.point,
        this.status,
        this.wallet,
        this.permissions,
        this.firebaseToken,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        archiveReason: json["archiveReason"],
        id: json["_id"],
        userId: json["id"],
        email: json["email"],
        password: json["password"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        avatar: json["avatar"],
        phoneNumber: json["phoneNumber"],
        city: json["city"],
        country: json["country"],
        address: json["address"],
        isEmailVerified: json["isEmailVerified"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        token: json["token"],
        favoriteArtists: json["favoriteArtists"] == null ? [] : List<String>.from(json["favoriteArtists"]!.map((x) => x)),
        isAdmin: json["isAdmin"],
        point: json["point"],
        status: json["status"],
        wallet: json["wallet"],
        permissions: json["permissions"] == null ? [] : List<String>.from(json["permissions"]!.map((x) => x)),
        firebaseToken: json["firebaseToken"],
    );

    Map<String, dynamic> toJson() => {
        "archiveReason": archiveReason,
        "_id": id,
        "id": userId,
        "email": email,
        "password": password,
        "firstName": firstName,
        "lastName": lastName,
        "avatar": avatar,
        "phoneNumber": phoneNumber,
        "city": city,
        "country": country,
        "address": address,
        "isEmailVerified": isEmailVerified,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "token": token,
        "favoriteArtists": favoriteArtists == null ? [] : List<dynamic>.from(favoriteArtists!.map((x) => x)),
        "isAdmin": isAdmin,
        "point": point,
        "status": status,
        "wallet": wallet,
        "permissions": permissions == null ? [] : List<dynamic>.from(permissions!.map((x) => x)),
        "firebaseToken": firebaseToken,
    };
}
