import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/color/color_app.dart';

class ThemeApp {
  static final ThemeData theme = ThemeData(
      scaffoldBackgroundColor: ColorApp.backgroundColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 1,
          backgroundColor: ColorApp.greyShade6,
          selectedItemColor: ColorApp.primaryColor,
          unselectedItemColor: ColorApp.greyShade3,
          type: BottomNavigationBarType.fixed),
      textTheme: TextTheme(
        titleSmall: GoogleFonts.inter(
          fontSize: 15,
          color: ColorApp.whiteColor,
        ),
        titleMedium: GoogleFonts.poppins(
          fontSize: 10,
          color: ColorApp.whiteColor,
        ),
      ));
}
