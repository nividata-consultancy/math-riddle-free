import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_riddle/core/app_colors.dart';

class ThemeController {
  static ThemeData theme() {
    final ThemeData base = ThemeData.from(
      colorScheme: const ColorScheme.dark(
        background: AppColor.black,
        primary: AppColor.white,
      ),
    );

    TextTheme buildTextThemeLight(TextTheme base) {
      TextTheme textTheme = GoogleFonts.oswaldTextTheme(base);
      return textTheme;
    }

    return base.copyWith(
        textTheme: buildTextThemeLight(base.textTheme),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColor.black,
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontFamily: "Roboto",
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            elevation: 0,
            // maximumSize: Size.fromHeight(52),
            shape: const ContinuousRectangleBorder(),
            disabledBackgroundColor: AppColor.blackLight,
          ),
        ));
  }
}
