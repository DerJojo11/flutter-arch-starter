import 'package:flutter/material.dart';
import 'package:flutter_arch_starter/shared/index.dart';

ThemeData get lightTheme {
  return ThemeData(
    colorScheme: _colorScheme,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarThemeData(
      backgroundColor: Colors.transparent,
    ),
    useMaterial3: true,
  );
}

ColorScheme get _colorScheme {
  return ColorScheme.fromSeed(
    seedColor: ColorTokens.blue,
    brightness: Brightness.light,
  );
}
