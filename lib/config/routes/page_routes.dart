import 'package:flutter/material.dart';
import 'package:youapp/app/modules/home/home_view.dart';
import 'package:youapp/app/modules/login/views/login_view.dart';
import 'package:youapp/app/modules/login/views/register_view.dart';
import 'package:youapp/app/modules/profile/home/views/profile_view.dart';
import 'package:youapp/app/modules/profile/update_interest/views/update_interest_view.dart';

class PageRoutes {
  static String loginView = "login_view";
  static String registerView = "register_view";
  static String homeView = "home_view";
  static String profileView = "profile_view";
  static String updateInterestView = "update_interest_view";

  Map<String, WidgetBuilder> routes() {
    return {
      loginView: (context) => const LoginView(),
      registerView: (context) => const RegisterView(),
      homeView: (context) => const HomeView(),
      profileView: (context) => const ProfileView(),
      updateInterestView: (context) {
        Map<String, dynamic>? argument = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
        return UpdateInterestView(
          interests: argument?["interests"] ?? [],
        );
        // return  UpdateInterestView(),
      }
    };
  }
}
