import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flu_bloc_boilerplate/features/presentation/utils/app_color.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: GoogleFonts.rubik().toString(),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 1,
    ),
    primaryColor: kColorPrimary,
    accentColor: kColorPrimary,
    hintColor: Color(0xffcdd3e0),
    dividerColor: Colors.grey[100],
    buttonColor: kColorPrimary,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      button: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: kColorBorder,
      )),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: kColorBorder,
      )),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: kColorPrimary.withOpacity(0.5),
      )),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.red.withOpacity(0.5),
      )),
      labelStyle: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: Colors.black,
        ),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: Color(0xffEBECED),
      thickness: 1,
      space: 1,
    ),
  );
}
