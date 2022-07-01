import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_dimy_tech/src/res/colors.dart';

final themeData = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kDimyCoffee60,
      primaryContainer: kDimyCoffee95,
      onPrimary: Colors.white,
      onPrimaryContainer: kDimyCoffee10,
      secondary: kDimyCoffee40,
      secondaryContainer: kDimyCoffee90,
      onSecondary: Colors.white,
      onSecondaryContainer: kDimyCoffee20,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: base.textTheme.labelMedium!.apply(
        fontFamily: GoogleFonts.josefinSans().fontFamily,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(
          width: 3.0,
          color: kDimyCoffee60,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(
          width: 3.0,
          color: kDimyCoffee60,
        ),
      ),
    ),
    textTheme: _buildAppTextTheme(base.textTheme),
  );
}

TextTheme _buildAppTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline5: base.headline5!.copyWith(
          fontWeight: FontWeight.w500,
        ),
        headline6: base.headline6!.copyWith(
          fontSize: 18.0,
        ),
        caption: base.caption!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyText1: base.bodyText1!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: GoogleFonts.josefinSans().fontFamily,
      );
}
