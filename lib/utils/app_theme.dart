import 'package:flutter/material.dart';
import 'package:giphy_test/utils/theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTheme {
  static light() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: kDarkBgColor,
      primaryColor: COLOR_PRIMARY,
      cardColor: const Color(0xffF1F3F6),
      iconTheme: const IconThemeData(
        color: COLOR_PRIMARY,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: kDarkBgColor,
      ),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: COLOR_PRIMARY_DARK),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        color: kDarkBgColor,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
          letterSpacing: .50,
          color: COLOR_PRIMARY_DARK,
        ),
        iconTheme: IconThemeData(color: COLOR_PRIMARY_DARK),
      ),
      tabBarTheme: const TabBarTheme(
        labelColor: COLOR_PRIMARY_DARK,
        dividerColor: kDarkBgColor,
        labelStyle: TextStyle(fontWeight: FontWeight.w600),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: COLOR_PRIMARY_DARK, width: 2),
        ),
      ),
      cardTheme: const CardTheme(color: Color(0XFFECEFF1)),

      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(
          color: COLOR_PRIMARY_DARK,
          fontSize: 13.0,
          fontWeight: FontWeight.w400,
        ),

        // contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        // filled: true,
        // fillColor: Color(0XFFECEFF1),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF03A9F4), width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: COLOR_PRIMARY_DARK),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFEEEEEE)),
        ),
        hintStyle: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.w200,
            color: COLOR_PRIMARY_DARK),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: COLOR_PRIMARY_DARK,
          textStyle: const TextStyle(
            letterSpacing: 1.0,
            fontSize: 13.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: COLOR_PRIMARY,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          elevation: 0,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            letterSpacing: 1.0,
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          shape: const StadiumBorder(),
          textStyle: const TextStyle(
            letterSpacing: 1.0,
            fontSize: 13.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      // textTheme: TextTheme(
      //   bodyText2: GoogleFonts.poppins(
      //     height: 1.2,
      //     fontSize: 12.0,
      //     color: const Color(0xff1B1D28),
      //     fontWeight: FontWeight.w400,
      //   ),
      //   bodyText1: GoogleFonts.poppins(
      //     height: 1.2,
      //     fontSize: 12.0,
      //     color: const Color(0xff7b7f9e),
      //     fontWeight: FontWeight.w400,
      //   ),
      //   headline2: GoogleFonts.poppins(
      //     fontSize: 24.0,
      //     color: const Color(0xff171822),
      //     fontWeight: FontWeight.w600,
      //   ),
      //   headline3: GoogleFonts.poppins(
      //     fontSize: 22.0,
      //     color: const Color(0xff3A4276),
      //     fontWeight: FontWeight.w600,
      //   ),
      //   headline4: GoogleFonts.poppins(
      //     fontSize: 15.0,
      //     color: const Color(0xff3A4276),
      //     fontWeight: FontWeight.w600,
      //   ),
      //   headline5: GoogleFonts.poppins(
      //     fontSize: 14.0,
      //     color: Colors.black,
      //     fontWeight: FontWeight.w600,
      //   ),
      //   headline6: GoogleFonts.poppins(
      //     fontSize: 13.0,
      //     color: Colors.black,
      //     fontWeight: FontWeight.w500,
      //   ),
      //   subtitle1: GoogleFonts.poppins(
      //     fontSize: 14.0,
      //     color: Colors.black,
      //     fontWeight: FontWeight.w400,
      //   ),
      //   subtitle2: GoogleFonts.poppins(
      //     fontSize: 14.0,
      //     color: Colors.black,
      //     fontWeight: FontWeight.w600,
      //   ),
      // ),
      textTheme: TextTheme(
        bodyMedium: GoogleFonts.poppins(
          height: 1.2,
          fontSize: 12.0,
          color: const Color(0xff1B1D28),
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: GoogleFonts.poppins(
          height: 1.2,
          fontSize: 12.0,
          color: const Color(0xff7b7f9e),
          fontWeight: FontWeight.w400,
        ),
        displayMedium: GoogleFonts.poppins(
          fontSize: 24.0,
          color: const Color(0xff171822),
          fontWeight: FontWeight.w600,
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: 22.0,
          color: const Color(0xff3A4276),
          fontWeight: FontWeight.w800,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 15.0,
          color: const Color(0xff3A4276),
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: GoogleFonts.poppins(
          fontSize: 14.0,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: GoogleFonts.poppins(
          fontSize: 13.0,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: GoogleFonts.poppins(
          fontSize: 14.0,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

//--Input Style
TextStyle textFieldTextStyle = const TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 14.0,
  color: Color(0xff7b7f9e),
);
