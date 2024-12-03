class CountryNameIso {
    String? name;
    String? iso2;

    CountryNameIso({
        this.name,
        this.iso2,
    });

    factory CountryNameIso.fromJson(Map<String, dynamic> json) => CountryNameIso(
        name: json["name"],
        iso2: json["iso2"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "iso2": iso2,
    };
}