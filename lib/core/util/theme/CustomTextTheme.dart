import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextTheme{
  CustomTextTheme({required this.fontSizeDouble, required this.fontWeight, required this.color});
  double fontSizeDouble;
  FontWeight fontWeight;
  Color color;

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.nunitoSans(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
    headlineMedium: GoogleFonts.nunitoSans(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
    headlineSmall: GoogleFonts.nunitoSans(fontSize: 18.0, fontWeight: FontWeight.w800, color: Colors.black),

    titleLarge: GoogleFonts.montserrat(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
    titleMedium: GoogleFonts.montserrat(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),
    titleSmall: GoogleFonts.montserrat(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.black),

    bodyLarge: GoogleFonts.montserrat(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black),
    bodyMedium: GoogleFonts.montserrat(fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.black),
    bodySmall: GoogleFonts.montserrat(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.5)),

    labelLarge: GoogleFonts.montserrat(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black),
    labelMedium: GoogleFonts.montserrat(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black.withOpacity(0.5)),
    labelSmall: GoogleFonts.montserrat(fontSize: 10.0, fontWeight: FontWeight.w600, textStyle: const TextStyle(overflow: TextOverflow.visible)),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.montserrat().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: GoogleFonts.montserrat().copyWith(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
    headlineSmall: GoogleFonts.montserrat().copyWith(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),

    titleLarge: GoogleFonts.montserrat().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
    titleMedium: GoogleFonts.montserrat().copyWith(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white),
    titleSmall: GoogleFonts.montserrat().copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.white),

    bodyLarge: GoogleFonts.montserrat().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white),
    bodyMedium: GoogleFonts.montserrat().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.white),
    bodySmall: GoogleFonts.montserrat().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.5)),

    labelLarge: GoogleFonts.montserrat().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.white),
    labelMedium: GoogleFonts.montserrat().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.white.withOpacity(0.5)),
    labelSmall: GoogleFonts.montserrat(fontSize: 10.0, fontWeight: FontWeight.w600, textStyle: const TextStyle(overflow: TextOverflow.visible)),
  );
}