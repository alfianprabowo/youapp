import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:youapp/app/utils/helper/form_validator.dart';

import '../../../../config/environment/secure_storage_service.dart';
import '../../../../config/network/response_status.dart';
import '../../../utils/constants/app_const.dart';
import '../repositories/login_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final ILoginRepository loginRepository;

  LoginCubit(
    this.loginRepository,
  ) : super(InitialLoginState());

  login(String emailUsername, String password) async {
    emit(LoadingLoginState());
    try {
      Map<String, String> allValues = await storage.readAll();
      String jsonString = jsonEncode(allValues);
      debugPrint("------------- $jsonString");

      String email = "";
      String username = "";
      if (emailUsername.isValidEmail) {
        email = emailUsername;
        username = "";
      } else {
        email = "";
        username = emailUsername;
      }
      deleteAll();
      ResponseStatus responseStatus = await loginRepository.login(
        email,
        username,
        password,
      );

      if (responseStatus.message != "User has been logged in successfully") {
        emit(FailureLoginState(errorMessage: responseStatus.message ?? "Login Failed"));
      } else {
        Map token = {"accessToken": responseStatus.accessToken};
        await writeAllValue(token);
        emit(SuccessLoginState(successMessage: responseStatus.message ?? ""));
      }
    } catch (e) {
      emit(InitialLoginState());
    }
  }

  writeAllValue(dynamic data) async {
    Future.wait([
      writeValue(loginAccessToken, data["accessToken"]),
    ]);
  }

  register(String email, String username, String password) async {
    emit(LoadingLoginState());
    try {
      ResponseStatus registerResponseStatus = await loginRepository.register(email, username, password);
      if (registerResponseStatus.message != "User has been created successfully") {
        emit(FailureLoginState(errorMessage: registerResponseStatus.message ?? "Failed"));
      } else {
        // deleteAll();
        ResponseStatus loginResponseStatus = await loginRepository.login(email, username, password);
        if (loginResponseStatus.message != "User has been logged in successfully") {
          emit(FailureLoginState(errorMessage: loginResponseStatus.message ?? "Login Failed"));
        } else {
          Map token = {"accessToken": loginResponseStatus.accessToken};
          await writeAllValue(token);
          emit(SuccessLoginState(successMessage: loginResponseStatus.message ?? ""));
        }
      }
    } catch (e) {
      emit(InitialLoginState());
    }
  }
}
