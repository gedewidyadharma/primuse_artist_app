import 'package:get/get_connect/connect.dart';
import '../../helper/helper.dart';
import '../../utils/logging/logger.dart';
import 'responses/responses.dart';

class Api {
  final _getConnect = GetConnect();

  Future<ResponseData> get({
    required String url,
    Map<String, String>? headers,
  }) async {
    late ResponseData? responseData;
    try {
      _getConnect.timeout = const Duration(days: 10); //make no timeout
      var resp = await _getConnect.get(url, headers: headers);
      var message = getMessage(resp);
      responseData = ResponseData(statusCode: resp.statusCode, message: message, data: resp.bodyString);
      responseData = ResponseProvider.parse(resp);
    } catch (err) {
      LoggerHelper.error('Response $url --> $err');
      responseData = ResponseError.defaultError();
    }

    return responseData;
  }

  Future<ResponseData> post({
    required String url,
    required dynamic body,
    Map<String, String>? headers,
  }) async {
    late ResponseData? responseData;
    try {
      _getConnect.timeout = const Duration(days: 10); //make no timeout
      var resp = await _getConnect.post(url, body, headers: headers);
      LoggerHelper.info('Response $url --> ${resp.body}');
      var message = getMessage(resp);
      responseData = ResponseData(statusCode: resp.statusCode, message: message, data: resp.bodyString);
    } catch (err) {
      LoggerHelper.error('Response $url --> $err');
      responseData = ResponseError.defaultError();
    }

    return responseData;
  }

  Future<ResponseData> put({
    required String url,
    required dynamic body,
    Map<String, String>? headers,
  }) async {
    late ResponseData? responseData;
    try {
      _getConnect.timeout = const Duration(days: 10); //make no timeout
      var resp = await _getConnect.put(url, body, headers: headers);
      LoggerHelper.info('Response $url--> ${resp.body}');
      var message = getMessage(resp);
      responseData = ResponseData(statusCode: resp.statusCode, message: message, data: resp.bodyString);
    } catch (err) {
      LoggerHelper.error('Response $url --> $err');
      responseData = ResponseError.defaultError();
    }

    return responseData;
  }

  Future<ResponseData> delete({
    required String url,
    Map<String, String>? headers,
  }) async {
    late ResponseData? responseData;
    try {
      _getConnect.timeout = const Duration(days: 10); //make no timeout
      var resp = await _getConnect.delete(url, headers: headers);
      LoggerHelper.info('Response $url--> ${resp.body}');
      var message = getMessage(resp);
      responseData = ResponseData(statusCode: resp.statusCode, message: message, data: resp.bodyString);
    } catch (err) {
      LoggerHelper.error('Response $url --> $err');
      responseData = ResponseError.defaultError();
    }

    return responseData;
  }
}

String getMessage(Response resp) {
  try {
    String? message = resp.body['message'];
    if (message != null) {
      return message;
    }

    message = resp.body['error']?['message'];
    if (message != null) {
      return message;
    }

    message = resp.statusText;
    if (message != null) {
      return message;
    }
  } catch (e) {}
  return "Something went wrong. Please try again in a moment.";
}
