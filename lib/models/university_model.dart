// To parse this JSON data, do
//
//     final universityModel = universityModelFromJson(jsonString);

import 'dart:convert';

List<UniversityModel> universityModelFromJson(String str) =>
    List<UniversityModel>.from(
        json.decode(str).map((x) => UniversityModel.fromJson(x)));

String universityModelToJson(List<UniversityModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UniversityModel {
  Country country;
  AlphaTwoCode alphaTwoCode;
  String name;
  dynamic stateProvince;
  List<String> domains;
  List<String> webPages;

  UniversityModel({
    required this.country,
    required this.alphaTwoCode,
    required this.name,
    this.stateProvince,
    required this.domains,
    required this.webPages,
  });

  factory UniversityModel.fromJson(Map<String, dynamic> json) =>
      UniversityModel(
        country: countryValues.map[json["country"]]!,
        alphaTwoCode: alphaTwoCodeValues.map[json["alpha_two_code"]]!,
        name: json["name"],
        stateProvince: json["state-province"],
        domains: List<String>.from(json["domains"].map((x) => x)),
        webPages: List<String>.from(json["web_pages"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "country": countryValues.reverse[country],
        "alpha_two_code": alphaTwoCodeValues.reverse[alphaTwoCode],
        "name": name,
        "state-province": stateProvince,
        "domains": List<dynamic>.from(domains.map((x) => x)),
        "web_pages": List<dynamic>.from(webPages.map((x) => x)),
      };
}

enum AlphaTwoCode { ID }

final alphaTwoCodeValues = EnumValues({"ID": AlphaTwoCode.ID});

enum Country { INDONESIA }

final countryValues = EnumValues({"Indonesia": Country.INDONESIA});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
