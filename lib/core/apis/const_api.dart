import 'dart:io';

enum PostType { json, multipart }

class HttpHeader {
  static const authorization = 'Authorization';
  static const authSecurityPayshare = 'auth_security_payshare';

  static const headers = <String, String>{
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
  };

  static headersWithAuth(String? token) => <String, String>{
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: "Bearer ${token != null ? token.replaceAll('"', '') : ""}",
      };

  static headersOnlyAuth(String? token) => <String, String>{
        HttpHeaders.authorizationHeader: "Bearer ${token != null ? token.replaceAll('"', '') : ""}",
      };
}

class Timeout {
  static const defaultValue = Duration(minutes: 5);
  static const getListDuration = Duration(seconds: 15);
}