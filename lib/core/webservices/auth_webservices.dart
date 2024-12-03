import '../../helper/helper.dart';
import '../core.dart';

class AuthWebservices {
  final StorageSession _storageSession = StorageSession();

  Future<ResponseData> login(Object data) async {
    try {
      var resp = await Api().post(url: AppEndpoint.login, body: data, headers: HttpHeader.headers);
      return resp;
    } catch (e) {
      LoggerHelper.error("login --> $e");
      return ResponseError.defaultError();
    }
  }
}
