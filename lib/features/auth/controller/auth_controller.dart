import 'package:flutter/material.dart';
import 'package:thapasya/features/auth/service/auth_service.dart';

class AuthController extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;

  Future<Map<String, dynamic>?> login({
    required String username,
    required String password,
  }) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final result = await AuthService().loginUser(
        username: username,
        password: password,
      );

      if (result != null && result['message'] == "Login succesfull!") {
        return result;
      } else {
        errorMessage = result?['message'] ?? "Login failed";
        return null;
      }
    } catch (e) {
      errorMessage = "Something went wrong";
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}