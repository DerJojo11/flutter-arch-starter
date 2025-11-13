part of 'theme_bloc.dart';

@freezed
sealed class ThemeState with _$ThemeState {
  const factory ThemeState.light() = _LightTheme;
  const factory ThemeState.dark() = _DarkTheme;
}
