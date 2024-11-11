import 'package:flutter/material.dart';
import 'package:youapp/app/modules/login/views/login_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:youapp/app/modules/splash_screen/views/splash_screen_view.dart';

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
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        // Locale('en'),
        Locale('id'),
      ],
      home: const SplasScreenView(),
    );
  }
}
