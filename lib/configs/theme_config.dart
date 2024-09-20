import 'package:ekarma/configs/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData myDefaultTheme = ThemeData(

  fontFamily: 'Plus Jakarta Sans',

  colorScheme: const ColorScheme.light().copyWith(
    primary: AppColors.primaryColor,
    background: Colors.white,
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: AppColors.primaryColor // button text color
    ),
  ),

  primaryTextTheme: const TextTheme(
    bodySmall: TextStyle(fontSize: 16.0, fontFamily: 'Plus Jakarta Sans', color: Colors.black87),
  ),

  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 24.0, fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w800, color: Colors.black),
    titleMedium: TextStyle(fontSize: 20.0, fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w800, color: Colors.black),
    titleSmall: TextStyle(fontSize: 18.0, fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w800, color: Colors.black,),
    bodyLarge: TextStyle(fontSize: 18.0, fontFamily: 'Plus Jakarta Sans',),
    bodyMedium: TextStyle(fontSize: 16.0, fontFamily: 'Plus Jakarta Sans'),
    bodySmall: TextStyle(fontSize: 14.0, fontFamily: 'Plus Jakarta Sans'),
  ),
);