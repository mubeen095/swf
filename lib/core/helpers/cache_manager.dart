import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class CacheManager {
  final SharedPreferences sp;

  CacheManager({required this.sp});

  Future<bool> saveToken(String token) async {
    return await sp.setString("TOKEN", token);
  }

  String? getToken() {
    return sp.getString("TOKEN");
  }

  Future<bool> removeToken() async {
    return await sp.remove("TOKEN");
  }

  Future<bool> saveUserDocsStatus() async {
    return await sp.setBool("DOC_SAVED", true);
  }

  bool? getUserDocsStatus() {
    return sp.getBool("DOC_SAVED");
  }

  Future<bool?> removeUserDocsStatus() async {
    return await sp.remove("DOC_SAVED");
  }
}
