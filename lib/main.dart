import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tempusapp/repository.dart';
import 'package:tempusapp/repository_inherited.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final conteudoRepository = ConteudoRepository();

  await conteudoRepository.initRepo();

  runApp(
      RepositoryInherited(repository: conteudoRepository, child: TempusApp()));
}

class TempusApp extends StatefulWidget {
  const TempusApp({super.key});

  @override
  State<TempusApp> createState() => _TempusAppState();
}

class _TempusAppState extends State<TempusApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _onThemeChanged(ThemeMode newThemeMode) {
    setState(() {
      _themeMode = newThemeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // This theme was made for FlexColorScheme version 6.1.1. Make sure
// you use same or higher version, but still same major version. If
// you use a lower version, some properties may not be supported. In
// that case you can also remove them after copying the theme to your app.
      theme: FlexThemeData.light(
        scheme: FlexScheme.redWine,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 9,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          elevatedButtonRadius: 13.0,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // To use the playground font, add GoogleFonts package and uncomment
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.redWine,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 15,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          elevatedButtonRadius: 13.0,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // To use the Playground font, add GoogleFonts package and uncomment
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
      themeMode: _themeMode,

      home: HomePage(
        themeMode: _themeMode,
        onThemeChanged: _onThemeChanged,
      ),
    );
  }
}
