import 'package:flutter/material.dart';
import 'package:youapp/config/network/response_status.dart';
import 'package:youapp/config/network/services.dart';

import '../../../data/models/user.dart';

abstract class IProfileRepository {
  Future<ResponseStatus> getProfile();
  Future<ResponseStatus> createProfile(User user);
  Future<ResponseStatus> updateProfile(User user);
}

class ProfileRepository implements IProfileRepository {
  BuildContext context;
  ProfileRepository(this.context);

  @override
  Future<ResponseStatus> getProfile() async {
    return await Network(context).getProfile();
  }

  @override
  Future<ResponseStatus> createProfile(User user) async {
    return await Network(context).createProfile(user);
  }

  @override
  Future<ResponseStatus> updateProfile(User user) async {
    return await Network(context).updateProfile(user);
  }
}
