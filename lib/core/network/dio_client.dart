import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
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
              debugPrint(
                "DioClient: Token = ${token != null && token.isNotEmpty ? 'present' : 'null'}",
              );
              debugPrint("DioClient: Request URL = ${options.uri}");

              if (token != null && token.isNotEmpty) {
                options.headers['Authorization'] = 'Bearer $token';
                options.headers['Cookie'] = 'access_token=$token';
                debugPrint("DioClient: Authorization header set");
                debugPrint("DioClient: Cookie header set");
              }
              return handler.next(options);
            },

            onResponse: (response, handler) {
              debugPrint("DioClient: Response status = ${response.statusCode}");

              return handler.next(response);
            },

            onError: (e, handler) {
              debugPrint("DioClient: Error = ${e.message}");
              if (e.response?.statusCode == 401) {
                debugPrint("DioClient: 401 Unauthorized - Token rejected");
                debugPrint("DioClient: Response Data => ${e.response?.data}");
              }

              return handler.next(e);
            },
          ),
        );
}
