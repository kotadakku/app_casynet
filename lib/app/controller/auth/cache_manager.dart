import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../../data/model/user.dart';

mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  Future<void> saveUsers(jsonUser) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.USER.toString(), jsonEncode(jsonUser));
  }

  User? getUsers() {
    final box = GetStorage();
    var result = box.read(CacheManagerKey.USER.toString());
    User user = User();
    if (result != null) {
      user = User.successLogin(jsonDecode(result));
      return user;
    }
  }
  Future<void> removeUser() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.USER.toString());
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.TOKEN.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();

    await box.remove(CacheManagerKey.TOKEN.toString());
  }
}

enum CacheManagerKey { TOKEN, USER }