import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp/app/modules/profile/repositories/profile_repository.dart';
import 'package:youapp/app/utils/constants/app_const.dart';
import 'package:youapp/config/environment/secure_storage_service.dart';
import 'package:youapp/config/network/response_status.dart';

import '../../../data/models/user.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final IProfileRepository profileRepository;

  ProfileCubit(
    this.profileRepository,
  ) : super(LoadingProfileState()) {
    getProfile();
  }

  getProfile() async {
    emit(LoadingProfileState());
    try {
      final User userData = await loadUserData();

      emit(
        // InitialProfileState(
        //   username: "username",
        //   age: 0,
        //   birthday: "userData.birthday",
        //   horoscope: "",
        //   horoscopeIcon: "",
        //   zodiac: "",
        //   zodiacIcon: "",
        //   interests: [],
        //   height: 0,
        //   weight: 0,
        // ),
        InitialProfileState(
          username: userData.username ?? "",
          name: userData.name ?? "",
          age: 0,
          birthday: userData.birthday ?? "",
          horoscope: userData.horoscope ?? "",
          horoscopeIcon: "",
          zodiac: userData.zodiac ?? "",
          zodiacIcon: "",
          interests: userData.interests ?? [],
          height: userData.height ?? 0,
          weight: userData.weight ?? 0,
        ),
      );
    } catch (e) {
      emit(ProfileMessage(errorMessage: e.toString()));
    }
  }

  Future<User> loadUserData() async {
    User userData = const User();
    final ResponseStatus response = await profileRepository.getProfile();
    if (response.data != null && response.data.isNotEmpty) {
      Map<String, dynamic> l = jsonDecode(jsonEncode(response.data));
      userData = User.fromJson(l);
    }
    return userData;
  }

  logout() {
    deleteAll();
    emit(ProfileLogOut());
  }

  Future<User> createProfile(User user) async {
    User userData = const User();
    final ResponseStatus response = await profileRepository.createProfile(user);
    if (response.data != null && response.data.isNotEmpty) {
      Map<String, dynamic> l = jsonDecode(jsonEncode(response.data));
      userData = User.fromJson(l);
    }
    return userData;
  }
}
