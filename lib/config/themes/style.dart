import 'package:flutter/material.dart';
import 'package:youapp/app/utils/constants/color_const.dart';

import '../../app/utils/helper/custom_color.dart';

final ThemeData appTheme = ThemeData(
  // colorScheme: ColorScheme.fromSwatch(
  //   primarySwatch: createMaterialColor(
  //     plainBackgroundColor,
  //     opacity: 1,
  //   ),
  // ).copyWith(
  //   primary: plainBackgroundColor,
  // secondary: secondaryColor,
  // surface: backgroundColor,
  // ),
  // colorScheme: ColorScheme.fromSeed(
  // ),
  // brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: primaryBlueColor,
    // surface: plainBackgroundColor,
  ),
  fontFamily: 'Inter',
);
