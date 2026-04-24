import 'package:dio/dio.dart';
import 'auth_token.dart';
import '../constants/app_urls.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppUrls.baseUrl,
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  static Options authOptions() {
    final token = AuthToken.token;

    if (token == null) {
      throw Exception("Token is null. Please login again.");
    }

    return Options(
      headers: {
        'Cookie': 'access_token=$token',
      },
    );
  }
}