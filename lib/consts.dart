import 'package:flutter/material.dart';

const String AUDIO = "Áudio";
const String VIDEO = "Vídeo";

customTextStl(String title) {
  return Text(title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ));
}

customThemeData() {
  return ThemeData(colorScheme: flexSchemeLight);
}

const ColorScheme flexSchemeLight = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff9b1b30),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xffedbac2),
  onPrimaryContainer: Color(0xff141010),
  secondary: Color(0xffa4121c),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xffffdad5),
  onSecondaryContainer: Color(0xff141212),
  tertiary: Color(0xffa70043),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xffffd9df),
  onTertiaryContainer: Color(0xff141213),
  error: Color(0xff790000),
  onError: Color(0xffffffff),
  errorContainer: Color(0xfff1d8d8),
  onErrorContainer: Color(0xff141212),
  background: Color(0xfffbf6f7),
  onBackground: Color(0xff090909),
  surface: Color(0xfffbf6f7),
  onSurface: Color(0xff090909),
  surfaceVariant: Color(0xfff7eef0),
  onSurfaceVariant: Color(0xff131212),
  outline: Color(0xff565656),
  shadow: Color(0xff000000),
  inverseSurface: Color(0xff151112),
  onInverseSurface: Color(0xfff5f5f5),
  inversePrimary: Color(0xffffb4c1),
  surfaceTint: Color(0xff9b1b30),
);
