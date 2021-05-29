import 'package:flutter/material.dart';
import 'colors.dart' as colors;

class Themes {
  static ThemeData kIOSTheme = new ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: Colors.grey[100],
    primaryColorBrightness: Brightness.light,
  );

  static ThemeData kDefaultTheme = new ThemeData(
    primarySwatch: Colors.blue,
    accentColor: Colors.blue[400],
  );

  final ThemeData theme = ThemeData(
      primaryColor: colors.primaryColor,
      accentColor: colors.accentColor,
      scaffoldBackgroundColor: colors.backgroundColor,
      appBarTheme: AppBarTheme(
          color: colors.backgroundColor,
          iconTheme: IconThemeData(color: colors.accentLightColor)),
      buttonTheme: ButtonThemeData(
          buttonColor: colors.accentLightColor,
          disabledColor: colors.primaryColorDark));
}
