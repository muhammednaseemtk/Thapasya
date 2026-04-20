import 'package:dio/dio.dart';
import 'package:thapasya/core/constants/app_urls.dart';

class AuthService {
  late final Dio dio;

  AuthService() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppUrls.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

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
        return response.data;
      } else {
        return {
          "message": "Something went wrong",
        };
      }

    } on DioException catch (e) {
      return {
        "message": e.response?.data?['message'] ?? "Login failed",
      };
    } catch (e) {
      return {
        "message": "Unexpected error",
      };
    }
  }
}