import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flu_bloc_boilerplate/features/presentation/utils/app_color.dart';

const gradientBackgroundDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Color(0xffFFFFFF), Color(0xffDFEDFD)],
  ),
);

// TEXT STYLE
final bodyText1TextStyle = GoogleFonts.rubik(
  textStyle: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: kColorPrimaryText,
  ),
);
final bodyText2TextStyle = GoogleFonts.rubik(
  textStyle: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: kColorPrimaryText,
  ),
);
final subtitle2TextStyle = GoogleFonts.rubik(
  textStyle: TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  ),
);
final captionTextStyle = GoogleFonts.rubik(
  textStyle: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: kColorPrimaryText,
  ),
);
final headline1TextStyle = GoogleFonts.rubik(
  textStyle: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: kColorPrimary,
  ),
);
final headline2TextStyle = GoogleFonts.rubik(
  textStyle: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: kColorPrimary,
  ),
);
final headerTextStyle = GoogleFonts.rubik(
  textStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  ),
);
