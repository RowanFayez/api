import 'package:flutter/material.dart';
import 'custom_colors.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: CustomColors.primary,
  accentColor: CustomColors.accent,
  scaffoldBackgroundColor: CustomColors.background,
  textTheme: TextTheme(
    headline6: TextStyle(color: CustomColors.textPrimary),
    bodyText2: TextStyle(color: CustomColors.textPrimary),
  ),
  cardTheme: CardTheme(elevation: 3, margin: EdgeInsets.all(8)),
);
