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

              return handler.next(options);
            },

            onResponse: (response, handler) {
              return handler.next(response);
            },

            onError: (e, handler) {
              return handler.next(e);
            },
          ),
        );
}
