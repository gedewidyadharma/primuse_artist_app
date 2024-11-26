import 'dart:convert';

ResponseData responseDataFromJson(String str) =>
    ResponseData.fromJson(json.decode(str));

String responseDataToJson(ResponseData data) => json.encode(data.toJson());

class ResponseData {
  ResponseData({
    this.statusCode,
    this.message,
    this.data,
  });

  int? statusCode;
  String? message;
  String? data;

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
        statusCode: json["status_code"],
        message: json["message"],
        data: json["data"] != null ? jsonEncode(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "data": data,
      };
}
