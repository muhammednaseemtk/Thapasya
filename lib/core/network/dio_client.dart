import 'package:dio/dio.dart';
import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/core/network/auth_token.dart';

class DioClient {
  static final Dio dio =
      Dio(
          BaseOptions(
            baseUrl: AppUrls.baseUrl,

            headers: {
              "Content-Type": "application/json",
              "accept": "application/json",
            },

            validateStatus: (status) {
              return status != null && status < 500;
            },
          ),
        )
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) {
              final token = AuthToken.token;

              if (token != null) {
                options.headers['Cookie'] = 'access_token=$token';
              }

              print("REQUEST => ${options.path}");
              print("HEADERS => ${options.headers}");
              print("DATA => ${options.data}");

              return handler.next(options);
            },

            onResponse: (response, handler) {
              print("RESPONSE => ${response.data}");

              return handler.next(response);
            },

            onError: (e, handler) {
              print("ERROR => ${e.response?.statusCode}");
              print("ERROR DATA => ${e.response?.data}");

              return handler.next(e);
            },
          ),
        );
}
