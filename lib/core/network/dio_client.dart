import 'package:dio/dio.dart';
import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/core/network/auth_token.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppUrls.baseUrl,
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  )..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = AuthToken.token;

          if (token != null) {
            options.headers['Cookie'] = 'access_token=$token';
          }

          print("REQUEST => ${options.path}");
          print("HEADERS => ${options.headers}");

          return handler.next(options);
        },
        onError: (e, handler) {
          print("ERROR => ${e.response?.statusCode}");
          return handler.next(e);
        },
      ),
    );
}