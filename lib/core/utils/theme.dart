import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'colors.dart';

const fontFamily = 'Urbanist';

var appTheme = ThemeData(
    primaryColor: primaryColor,
    dialogBackgroundColor: white,
    drawerTheme: const DrawerThemeData(backgroundColor: white),
    useMaterial3: true,
    scaffoldBackgroundColor: white,
    indicatorColor: primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: white,
    ),
    inputDecorationTheme: const InputDecorationTheme(

        focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: primaryColor),
    )),
    switchTheme: SwitchThemeData(
      trackOutlineColor:
          MaterialStateColor.resolveWith((states) => primaryColor),
      trackColor: MaterialStateColor.resolveWith((states) => primaryColor),
      thumbColor: MaterialStateColor.resolveWith((states) => white),
    ),
    radioTheme: RadioThemeData(
      materialTapTargetSize: MaterialTapTargetSize.padded,
      fillColor: MaterialStateColor.resolveWith((states) => primaryColor),
    ),
    textTheme: TextTheme(
      labelSmall: TextStyle(
        fontFamily: fontFamily,
        color: black.withOpacity(0.5),
        fontWeight: FontWeight.w400,
        fontSize: 15.sp,
      ),
      bodyLarge: TextStyle(
        fontFamily: fontFamily,
        color: black,
        fontWeight: FontWeight.bold,
        fontSize: 18.sp,
      ),
      bodyMedium: TextStyle(
        fontFamily: fontFamily,
        color: black,
        fontWeight: FontWeight.w500,
        fontSize: 18.sp,
      ),
      bodySmall: TextStyle(
        fontFamily: fontFamily,
        color: black,
        fontSize: 15.sp,
      ),
      labelMedium: TextStyle(
        fontFamily: fontFamily,
        color: black,
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
      ),
      labelLarge: TextStyle(
        fontFamily: fontFamily,
        color: blackTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
      ),
      displayLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: 22.sp,
          fontWeight: FontWeight.w500,
          color: white),
      displayMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: 19.sp,
          fontWeight: FontWeight.w700,
          color: black),
    ));
