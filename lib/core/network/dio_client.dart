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
    return Options(
      headers: {
        'Cookie': 'access_token=${AuthToken.token}', 
      },
    );
  }
}