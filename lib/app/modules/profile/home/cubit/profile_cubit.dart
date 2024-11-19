import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp/app/modules/profile/home/repositories/profile_repository.dart';
import 'package:youapp/app/utils/helper/calculate_age.dart';
import 'package:youapp/config/environment/secure_storage_service.dart';
import 'package:youapp/config/network/response_status.dart';

import '../../../../data/models/user.dart';
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
      // final User userData = await loadUserData();
      User userData = const User();
      final ResponseStatus response = await profileRepository.getProfile();

      if (response.statusCode != null) {
        emit(ProfileLogOut());
      }
      if (response.data != null && response.data.isNotEmpty && response.message == "Profile has been found successfully") {
        Map<String, dynamic> l = jsonDecode(jsonEncode(response.data));
        userData = User.fromJson(l);
        int? age;
        if (userData.birthday == "" || userData.birthday == null) {
          age = 0;
        } else {
          age = calculateAge(userData.birthday!);
        }
        emit(
          InitialProfileState(
            username: userData.username ?? "",
            name: userData.name ?? "",
            age: age ?? 0,
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
      } else {
        // emit(ProfileMessage(errorMessage: response.message));

        logout();
      }
    } catch (e) {
      if (!isClosed) emit(ProfileMessage(errorMessage: e.toString()));
    }
  }

  updating(bool isUpdating) {
    // isUpdating => emit(EditProfileState());
  }

  // Future<User> loadUserData() async {
  // return userData;
  // }

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

  Future<User> updateProfile(User user) async {
    User userData = const User();
    final ResponseStatus response = await profileRepository.updateProfile(user);
    if (response.data != null && response.data.isNotEmpty) {
      Map<String, dynamic> l = jsonDecode(jsonEncode(response.data));
      userData = User.fromJson(l);
    }
    return userData;
  }
}
