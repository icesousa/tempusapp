import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

const String audio = "Áudio";
const String video = "Vídeo";

Widget customTextStl(String title) {
  return Text(title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ));
}

customLightTheme() {
  return FlexThemeData.light(
    scheme: FlexScheme.redWine,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 9,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      elevatedButtonRadius: 13.0,
    ),
  );
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

const ColorScheme flexSchemeDark = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xffe4677c),
  onPrimary: Color(0xfffff7f8),
  primaryContainer: Color(0xff9b1b30),
  onPrimaryContainer: Color(0xfff8e4e7),
  secondary: Color(0xffbd545b),
  onSecondary: Color(0xfffdf5f6),
  secondaryContainer: Color(0xff930012),
  onSecondaryContainer: Color(0xfff6dfe2),
  tertiary: Color(0xffc87a98),
  onTertiary: Color(0xfffef8fa),
  tertiaryContainer: Color(0xff910037),
  onTertiaryContainer: Color(0xfff6dfe8),
  error: Color(0xffcf6679),
  onError: Color(0xff140c0d),
  errorContainer: Color(0xffb1384e),
  onErrorContainer: Color(0xfffbe8ec),
  background: Color(0xff1d1617),
  onBackground: Color(0xffedecec),
  surface: Color(0xff1d1617),
  onSurface: Color(0xffedecec),
  surfaceVariant: Color(0xff291b1d),
  onSurfaceVariant: Color(0xffdddbdb),
  outline: Color(0xffa39d9d),
  shadow: Color(0xff000000),
  inverseSurface: Color(0xfffdf6f7),
  onInverseSurface: Color(0xff131313),
  inversePrimary: Color(0xff713b44),
  surfaceTint: Color(0xffe4677c),
);
