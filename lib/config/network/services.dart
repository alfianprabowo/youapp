import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:youapp/app/utils/constants/app_const.dart';
import 'package:youapp/config/network/request_interceptor.dart';

import '../../app/data/models/login.dart';
import '../../app/data/models/user.dart';
import '../environment/secure_storage_service.dart';
import 'response_status.dart';
import 'rest_client.dart';

class Network {
  late BuildContext context;

  final _receiveTimeout = const Duration(seconds: 5);
  final _connectTimeout = const Duration(seconds: 5);

  static final Network _network = Network._internal();

  Network._internal();

  factory Network(BuildContext context) {
    _network.context = context;
    return _network;
  }

  Future<RestClient> getRestClient() async {
    var prettyDioLogger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    );

    final dio = Dio(
      BaseOptions(
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
      ),
    );

    var accessTokenString = await readByKey(loginAccessToken) ?? "";

    dio.interceptors.addAll(
      [
        RequestInterceptor(
          accessToken: accessTokenString,
          // ignore: use_build_context_synchronously
          ctx: context,
        ),
        ErrorInterceptor(),
      ],
    );
    dio.interceptors.add(prettyDioLogger);

    return RestClient(
      dio,
      baseUrl: BASE_URL,
    );
  }

  // > LOGIN
  Future<ResponseStatus> login(Login login) async {
    RestClient client = await getRestClient();
    return client.login(login.toJson());
  }

  Future<ResponseStatus> register(Login login) async {
    RestClient client = await getRestClient();
    return client.register(login.toJson());
  }

  // > Profile
  Future<ResponseStatus> getProfile() async {
    RestClient client = await getRestClient();
    return client.getProfile();
  }

  Future<ResponseStatus> createProfile(User data) async {
    RestClient client = await getRestClient();
    return client.createProfile(data.toJson());
  }

  Future<ResponseStatus> updateProfile(User data) async {
    RestClient client = await getRestClient();
    return client.updateProfile(data.toJson());
  }

  Future<ResponseStatus> updateInterest(User data) async {
    RestClient client = await getRestClient();
    return client.updateProfile(data.toJson());
  }
}
