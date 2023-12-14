import 'package:flutter/material.dart';

const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFE1F7F6),
  100: Color(0xFFB5ECEA),
  200: Color(0xFF83DFDC),
  300: Color(0xFF51D2CD),
  400: Color(0xFF2CC8C3),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFF06B8B1),
  700: Color(0xFF05AFA8),
  800: Color(0xFF04A7A0),
  900: Color(0xFF029991),
});

const int _primaryPrimaryValue = 0xFF07BEB8;

const MaterialColor primaryAccent = MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFFC4FFFB),
  200: Color(_primaryAccentValue),
  400: Color(0xFF5EFFF5),
  700: Color(0xFF45FFF3),
});
const int _primaryAccentValue = 0xFF91FFF8;

const MaterialColor customBlack = MaterialColor(_customBlackPrimaryValue, <int, Color>{
  50: Color(0xFFE5E6E6),
  100: Color(0xFFBFC0C2),
  200: Color(0xFF949699),
  300: Color(0xFF696C70),
  400: Color(0xFF494D51),
  500: Color(_customBlackPrimaryValue),
  600: Color(0xFF24282D),
  700: Color(0xFF1F2226),
  800: Color(0xFF191C1F),
  900: Color(0xFF0F1113),
});

const int _customBlackPrimaryValue = 0xFF292D32;