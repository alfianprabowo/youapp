import 'package:flutter/material.dart';
import 'package:youapp/app/modules/home/home_view.dart';
import 'package:youapp/app/modules/login/views/login_view.dart';
import 'package:youapp/app/utils/constants/color_const.dart';

import 'config/routes/page_routes.dart';
import 'config/themes/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: TextConst.appName,
      debugShowCheckedModeBanner: false,
      darkTheme: appTheme,
      themeMode: ThemeMode.dark,
      routes: PageRoutes().routes(),

      home: LoginView(),
    );
  }
}
