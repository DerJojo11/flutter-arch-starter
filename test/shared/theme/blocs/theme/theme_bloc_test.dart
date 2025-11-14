import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/services.dart';
import 'package:flutter_arch_starter/shared/index.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ThemeBloc themeBloc;

  setUp(() {
    themeBloc = ThemeBloc();
  });

  blocTest<ThemeBloc, ThemeState>(
    'emits [ThemeState.dark] when _ChangeAppearance is added with ${Brightness.dark}.',
    build: () => themeBloc,
    act: (bloc) => bloc.add(const ThemeEvent.changeAppearance(brightness: Brightness.dark)),
    expect: () => const <ThemeState>[ThemeState.dark()],
  );

  blocTest<ThemeBloc, ThemeState>(
    'emits [ThemeState.light] when _ChangeAppearance is added with ${Brightness.light}.',
    build: () => themeBloc,
    act: (bloc) => bloc.add(const ThemeEvent.changeAppearance(brightness: Brightness.light)),
    expect: () => const <ThemeState>[ThemeState.light()],
  );
}
