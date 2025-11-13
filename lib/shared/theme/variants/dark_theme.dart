import 'package:bau_recht/shared/theme/extensions/gradient_extension.dart';
import 'package:bau_recht/shared/theme/tokens/color_tokens.dart';
import 'package:flutter/material.dart';

ThemeData get darkTheme {
  return ThemeData(
      colorScheme: _colorScheme,
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarThemeData(
        backgroundColor: Colors.transparent,
      ),
      extensions: [
        AppGradients.dark(),
      ]);
}

ColorScheme get _colorScheme {
  return ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: ColorTokens.blue,
  );
}
