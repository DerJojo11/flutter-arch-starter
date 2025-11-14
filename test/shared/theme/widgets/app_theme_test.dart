import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arch_starter/shared/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockThemeBloc extends MockBloc<ThemeEvent, ThemeState> implements ThemeBloc {}

void main() {
  late MockThemeBloc mockThemeBloc;

  setUp(
    () {
      mockThemeBloc = MockThemeBloc();
      when(() => mockThemeBloc.state).thenReturn(const ThemeState.light());
    },
  );

  Future<void> pumpWidget(WidgetTester tester) async {
    await tester.pumpWidget(MediaQuery(
      data: const MediaQueryData(platformBrightness: Brightness.light),
      child: BlocProvider<ThemeBloc>.value(
        value: mockThemeBloc,
        child: AppTheme(
          builder: (context, theme) => MaterialApp(
            theme: theme,
            home: const Scaffold(),
          ),
        ),
      ),
    ));
  }

  testWidgets('expect initial $ThemeData will be ${Brightness.light} based on platformBrightness', (tester) async {
    await pumpWidget(tester);

    expect(
        find.byWidgetPredicate(
          (widget) => widget is MaterialApp && widget.theme == lightTheme,
        ),
        findsOneWidget);
  });

  testWidgets('verify to change appearance when platformBrightness did change', (tester) async {
    await pumpWidget(tester);

    verify(() => mockThemeBloc.add(const ThemeEvent.changeAppearance(brightness: Brightness.light))).called(1);
  });
}
