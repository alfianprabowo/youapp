import 'package:flutter/material.dart';

import '../../../../config/network/response_status.dart';
import '../../../../config/network/services.dart';
import '../../../data/models/login.dart';

abstract class ILoginRepository {
  Future<ResponseStatus> login(
    String email,
    String username,
    String password,
  );

  Future<ResponseStatus> register(
    String email,
    String username,
    String password,
  );
}

class LoginRepository implements ILoginRepository {
  BuildContext context;
  LoginRepository(this.context);

  @override
  Future<ResponseStatus> login(
    String email,
    String username,
    String password,
  ) async {
    return await Network(context).login(Login(
      email: email,
      username: username,
      password: password,
    ));
  }

  @override
  Future<ResponseStatus> register(
    String email,
    String username,
    String password,
  ) async {
    return await Network(context).register(Login(
      email: email,
      username: username,
      password: password,
    ));
  }
}
