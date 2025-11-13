import 'package:bau_recht/shared/theme/tokens/color_tokens.dart';
import 'package:flutter/material.dart';

@immutable
class AppGradients extends ThemeExtension<AppGradients> {
  final Gradient background;

  const AppGradients({required this.background});

  factory AppGradients.light() => const AppGradients(
        background: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.0, 0.5, 1],
          colors: [
            ColorTokens.accentBackground,
            ColorTokens.accentBackground,
            ColorTokens.warmSand
          ],
        ),
      );

  // TODO (Hannes): Add dark mode
  factory AppGradients.dark() => const AppGradients(
        background: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1E2932),
            Color(0xFF2B2723),
          ],
        ),
      );

  @override
  AppGradients copyWith({Gradient? background}) =>
      AppGradients(background: background ?? this.background);

  @override
  AppGradients lerp(ThemeExtension<AppGradients>? other, double t) {
    if (other is! AppGradients) return this;
    return AppGradients(
      background: LinearGradient.lerp(
            background as LinearGradient,
            other.background as LinearGradient,
            t,
          ) ??
          other.background,
    );
  }
}
