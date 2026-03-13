enum UserRole { student, staff, admin }

class AuthController {
  AuthController._();

  static String email    = '';
  static String password = '';

  static bool validate() =>
      email.isNotEmpty && password.length >= 6;

  static Future<bool> login() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return validate();
  }
}