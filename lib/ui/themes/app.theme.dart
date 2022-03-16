import 'package:c2sanilist/ui/themes/color.theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightAppTheme(BuildContext context) => ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: colorProduct,
        background: colorBackgroundLight,
      ),
      textTheme: GoogleFonts.ralewayTextTheme(Theme.of(context).textTheme),
    ).copyWith(
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        centerTitle: true,
        color: colorBackgroundLight,
        titleTextStyle: TextStyle(color: Colors.black87),
      ),
    );

ThemeData darkAppTheme(BuildContext context) => ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: colorProduct,
        background: colorBackgroundDark,
      ),
      textTheme: GoogleFonts.ralewayTextTheme(Theme.of(context).textTheme),
    ).copyWith(
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        centerTitle: true,
        color: colorBackgroundDark,
        titleTextStyle: TextStyle(color: Colors.white),
      ),
    );