import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.mainColor,
    primaryColorLight: ColorManager.fristColor,
    primaryColorDark: ColorManager.secondColor,
    disabledColor: ColorManager.grey,
    splashColor: ColorManager.fristColor,

    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.white,
      elevation: AppSize.s0,
      shadowColor: ColorManager.fristColor,
      titleTextStyle:
          getBoldStyle(fontSize: FontSize.s25, color: ColorManager.black),
    ),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle:
            getRegularStyle(color: ColorManager.white, fontSize: FontSize.s17),
        primary: ColorManager.mainColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12)),
      ),
    ),

    // text theme
    textTheme: TextTheme(
      headlineLarge:
          getBoldStyle(color: ColorManager.black, fontSize: FontSize.s25),
      headlineMedium:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s20),
      titleMedium:
          getLightStyle(color: ColorManager.grey, fontSize: FontSize.s12),
    ),
  );
}
