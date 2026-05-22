import 'package:flutter/material.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/network/auth_token.dart';
import 'package:thapasya/features/auth/service/auth_logout_service.dart';

class AuthLogoutController extends ChangeNotifier {
  final service = AuthLogoutService();
  bool isLoading = false;

  Future<void> logout(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      await service.logoutUser();
    } catch (_) {}

    await AuthToken.clear();

    if (!context.mounted) return;

    isLoading = false;
    notifyListeners();

    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (_) => false);
  }
}
