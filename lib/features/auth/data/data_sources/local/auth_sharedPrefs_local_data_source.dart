import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_local_data_source.dart';

class AuthSharedprefsLocalDataSource implements AuthLocalDataSource {
  @override
  Future<void> saveToken(String token) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(CachedConstant.tokenKey, 'token');
    } catch (exception) {
      throw LocalException(message: "Failed to save token");
    }
  }

  @override
  Future<String> getToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(CachedConstant.tokenKey)!;
    } catch (exception) {
      throw LocalException(message: "Failed to get token");
    }
  }
}
