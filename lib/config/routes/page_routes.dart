import 'package:flutter/material.dart';
import 'package:youapp/app/modules/home/home_view.dart';
import 'package:youapp/app/modules/login/views/login_view.dart';
import 'package:youapp/app/modules/login/views/register_view.dart';
import 'package:youapp/app/modules/profile/views/profile_view.dart';

class PageRoutes {
  static String loginView = "login_view";
  static String registerView = "register_view";
  static String homeView = "home_view";
  static String profileView = "profile_view";

  Map<String, WidgetBuilder> routes() {
    return {
      loginView: (context) => const LoginView(),
      registerView: (context) => const RegisterView(),
      homeView: (context) => const HomeView(),
      profileView: (context) => const ProfileView(),
    };
  }
}
