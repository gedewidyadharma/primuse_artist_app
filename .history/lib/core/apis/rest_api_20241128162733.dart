import 'package:get/get_connect/connect.dart';
import '../../helper/helper.dart';
import 'responses/responses.dart';

class Api {
  final _getConnect = GetConnect();

  Future<ResponseData> get({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    late ResponseData? responseData;
    try {
      _getConnect.timeout = const Duration(days: 10); //make no timeout
      var resp = await _getConnect.get(url, headers: headers, query: queryParams);
      LoggerHelper.info('Response ${Uri.parse(url).replace(queryParameters: queryParams)} --> ${resp.body}');
      responseData = ResponseProvider.parse(resp);
    } catch (err) {
      LoggerHelper.error('Response error $url --> $err');
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
      responseData = ResponseProvider.parse(resp);
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
      LoggerHelper.info('Response $url --> ${resp.body}');
      responseData = ResponseProvider.parse(resp);
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
      LoggerHelper.info('Response $url --> ${resp.body}');
      responseData = ResponseProvider.parse(resp);
    } catch (err) {
      LoggerHelper.error('Response $url --> $err');
      responseData = ResponseError.defaultError();
    }

    return responseData;
  }
}
