import 'package:flutter_arch_starter/shared/get_it.dart';
import 'package:flutter_test/flutter_test.dart';

// This function is called by the testing framework before tests run
Future<void> testExecutable(Future<void> Function() testMain) async {
  // Configure theme, locale, etc. for all tests in this directory
  // For example, here's how to set up a theme and localizations
  // from the 'surf_widget_test_composer' package [5]:

  // Define theme
  // final myTheme = ThemeData.light();

  // Define localizations
  // final Map<String, Map<String, String>> myLocalizations = {
  //   'en': {'appTitle': 'My App'},
  // };

  // Use testExecutable to wrap the main test function [5]
  // return surfHelper.testExecutable(
  //   testMain: testMain,
  //   // themes: myTheme,
  //   // localizations: myLocalizations,
  // );

  // Or for a simple case, just run the main test function directly [4]

  tearDown(
    () {
      getIt.reset();
    },
  );

  await testMain();
}
