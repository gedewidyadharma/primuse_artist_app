import 'package:get_storage/get_storage.dart';

final _storage = GetStorage();

class StorageSession {
  static const String key = "keySession";

  static const String keyJwt = "keyTokenJwt";

  writeSession(String value) {
    _storage.write(key, value);
  }

  String readSession() {
    return _storage.read(key) ?? "";
  }

  void clearSession() {
    _storage.remove(key);
  }

    writeTokenJwt(String value) {
    _storage.write(keyJwt, value);
  }

  String readTokenJwt() {
    return _storage.read(keyJwt) ?? "";
  }

  void clearTokenJwt() {
    _storage.remove(keyJwt);
  }
}