import 'package:bau_recht/shared/theme/extensions/gradient_extension.dart';
import 'package:bau_recht/shared/theme/tokens/color_tokens.dart';
import 'package:flutter/material.dart';

ThemeData get lightTheme {
  return ThemeData(
    colorScheme: _colorScheme,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarThemeData(
      backgroundColor: Colors.transparent,
    ),
    useMaterial3: true,
    extensions: [
      AppGradients.light(),
    ],
  );
}

ColorScheme get _colorScheme {
  return ColorScheme.fromSeed(
    seedColor: ColorTokens.blue,
    brightness: Brightness.light,
  );
}
