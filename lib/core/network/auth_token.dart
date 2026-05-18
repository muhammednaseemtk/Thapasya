import 'package:shared_preferences/shared_preferences.dart';

class AuthToken {
  static String? token;
  static String? userRole;

  static Future<void> setToken(String value) async {
    token = value;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', value);
  }

  static Future<void> setRole(String role) async {
    userRole = role;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_role', role);
  }

  static Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('auth_token');
    userRole = prefs.getString('user_role');
  }

  static Future<void> clear() async {
    token = null;
    userRole = null;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('user_role');
  }

  static bool get isLoggedIn => token != null;
}
