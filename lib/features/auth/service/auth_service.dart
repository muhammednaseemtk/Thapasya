import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/core/network/auth_token.dart';
import 'package:thapasya/core/network/dio_client.dart';

class AuthService {

  Future<Map<String, dynamic>?> loginUser({
    required String username,
    required String password,
  }) async {
    try {
      final response = await DioClient.dio.post(
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

              await AuthToken.setToken(token);

              print("TOKEN SAVED: $token");
              break;
            }
          }
        }

        return response.data;
      } else {
        return {
          "message": "Login failed",
        };
      }

    } catch (e) {
      print("LOGIN ERROR: $e");

      return {
        "message": "Something went wrong",
      };
    }
  }
}