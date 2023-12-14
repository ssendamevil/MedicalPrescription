import 'package:flutter/material.dart';
import 'package:medical_prescription/core/util/theme/Colors.dart';
import 'package:medical_prescription/core/util/theme/CustomTextTheme.dart';

class AppTheme{
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: CustomTextTheme.lightTextTheme,
    primarySwatch: primary,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: CustomTextTheme.darkTextTheme
  );
}