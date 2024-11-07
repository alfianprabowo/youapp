import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RequestInterceptor extends Interceptor {
  String accessToken;
  BuildContext ctx;

  RequestInterceptor({
    required this.accessToken,
    required this.ctx,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      options.headers["Content-Type"] = "application/json";
      options.headers["Accept"] = "*/*";
      options.headers["Access-Control-Allow-Headers"] = "x-access-token";
      options.headers["x-access-token"] = accessToken;
    } catch (e) {
      debugPrint("LogoutException2 : ${e.toString()}");
      handler.reject(
        DioException(
          response: Response(
            requestOptions: options,
          ),
          requestOptions: options,
          error: e,
          type: DioExceptionType.unknown,
        ),
      );
    }
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    try {
      if ((err.response?.statusCode == 401)) {
        // if ((err.response?.statusCode == 401) && !loginPage) {
        // deleteAll();
        // Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(PageRoutes.loginPass, (Route<dynamic> route) => false);
        // showShortSnackBar(navigatorKey.currentContext!, "Session timeout, please login");
        debugPrint("error ${err.response?.statusCode}");
        handler.resolve(
          Response(
            data: {"success": false},
            requestOptions: RequestOptions(path: err.requestOptions.uri.toString()),
          ),
        );
      }
    } catch (e) {
      debugPrint("error $e");
    }
    if (!handler.isCompleted) {
      return super.onError(err, handler);
    }
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final status = response.statusCode;
    final isValid = status != null && status >= 200 && status < 300;
    if (!isValid) {
      throw DioException.badResponse(
        statusCode: status!,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
    super.onResponse(response, handler);
  }
}
