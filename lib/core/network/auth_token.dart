import 'package:shared_preferences/shared_preferences.dart';

class AuthToken {
  static String? token;

  static Future<void> setToken(String value) async {
    token = value;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', value);
  }

  static Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('auth_token');
  }

  static Future<void> clear() async {
    token = null;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }

  static bool get isLoggedIn => token != null;
}