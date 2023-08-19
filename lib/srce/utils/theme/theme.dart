import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/srce/utils/theme/widget_theme/elevated_button_theme.dart';
import 'package:login_app/srce/utils/theme/widget_theme/outlined_button_theme.dart';
import 'package:login_app/srce/utils/theme/widget_theme/text_field_theme.dart';
import 'package:login_app/srce/utils/theme/widget_theme/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTheme,
    // appBarTheme: TAppBarTheme.lightTheme,
    // elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
