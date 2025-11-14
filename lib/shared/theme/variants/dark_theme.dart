import 'package:flutter/material.dart';
import 'package:flutter_arch_starter/shared/index.dart';

ThemeData get darkTheme {
  return ThemeData(
    colorScheme: _colorScheme,
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarThemeData(
      backgroundColor: Colors.transparent,
    ),
  );
}

ColorScheme get _colorScheme {
  return ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: ColorTokens.blue,
  );
}
