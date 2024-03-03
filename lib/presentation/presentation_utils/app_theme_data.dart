import 'package:flutter/material.dart';

Color primaryColor = const Color(0XFF006590);
Color primary90Color = const Color(0xFFD4EBFF);
Color primary80Color = const Color(0xFF8193A2);
Color secondaryColor = const Color(0xFFFFB4AB);
Color textColor = const Color(0xFF151517);
Color whiteColor = const Color(0xFFFFFFFF);
Color backgroundColor = const Color(0XFFF6FAFF);
String fontName = 'Roboto';
ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: primaryColor,
    textTheme: TextTheme(
      //H1/Bold 28px
      displayLarge: TextStyle(
        color: textColor,
        fontFamily: fontName,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),
      //H1/Semi 28px
      displayMedium: TextStyle(
        color: textColor,
        fontFamily: fontName,
        fontSize: 28,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      ),
      //H1/Med 28px
      displaySmall: TextStyle(
        color: textColor,
        fontFamily: fontName,
        fontSize: 28,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
      ),
      //H2/Bold 26px
      headlineLarge: TextStyle(
        color: textColor,
        fontFamily: fontName,
        fontSize: 26,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),
      //H2/Semi 26px
      headlineMedium: TextStyle(
        color: textColor,
        fontFamily: fontName,
        fontSize: 26,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      ),
      //H2/Med 26px
      headlineSmall: TextStyle(
        color: textColor,
        fontFamily: fontName,
        fontSize: 26,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
      ),
      //H3/Bold 22px
      labelLarge: TextStyle(
        color: textColor,
        fontFamily: fontName,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),
      //H3/Semi 22px
      labelMedium: TextStyle(
        color: textColor,
        fontFamily: fontName,
        fontSize: 22,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      ),
      //H3/Med 22px
      labelSmall: TextStyle(
        color: textColor,
        fontFamily: fontName,
        fontSize: 22,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
      ),
      //H4/Bold 20px
      titleLarge: TextStyle(
        color: textColor,
        fontFamily: fontName,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),
      //H4/Semi 20px
      titleMedium: TextStyle(
        color: textColor,
        fontFamily: fontName,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      ),
      //H4/Med 20px
      titleSmall: TextStyle(
        color: textColor,
        fontFamily: fontName,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
      ),
      //H5/Bold 18px
      bodyLarge: TextStyle(
        color: textColor,
        fontFamily: fontName,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),
      //H5/Semi 18px
      bodyMedium: TextStyle(
        color: textColor,
        fontFamily: fontName,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      ),
      //H5/Med 18px
      bodySmall: TextStyle(
        color: textColor,
        fontFamily: fontName,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: whiteColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    ),
  );
}
