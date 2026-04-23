import 'package:dio/dio.dart';
import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/core/network/auth_token.dart';

class AuthService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppUrls.baseUrl,
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<Map<String, dynamic>?> loginUser({
    required String username,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        AppUrls.login,
        data: {
          "username": username,
          "password": password,
        },
      );

      if (response.statusCode == 200) {

        final cookies = response.headers.map['set-cookie'];

        if (cookies != null) {
          for (var cookie in cookies) {
            if (cookie.contains('access_token=')) {
              final token = cookie
                  .split(';')
                  .first
                  .replaceAll('access_token=', '');

              AuthToken.setToken(token);
              print("TOKEN SAVED: $token"); 
              break;
            }
          }
        }

        return response.data;
      } else {
        return {"message": "Login failed"};
      }
    } catch (e) {
      return {"message": "Error"};
    }
  }
}