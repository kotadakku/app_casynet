import 'package:get_storage/get_storage.dart';


class GetStorageProvider {

  GetStorage _box() {
    return GetStorage();
  }

  Future<bool> save({required String key, String? value}) async {
    if (value != null) {
      await _box().write(key, value);
      return true;
    }
    return false;
  }

  Future<String?> get({required String key}) async {
     var result =  await _box().read(key);
     return result;
  }

  Future<void> delete({required String key}) async {
    await _box().remove(key);
  }
}
enum CacheManagerKey {TOKEN, TOKEN_ADMIN , USER, USER_LOGIN, LANGUAGE }