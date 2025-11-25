import 'package:flutter/material.dart';
import 'package:flutter_arch_starter/app/index.dart';
import 'package:flutter_arch_starter/l10n/generated/app_localizations.dart';
import 'package:flutter_arch_starter/shared/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: AppTheme(
        builder: (context, theme) => MaterialApp.router(
          routerConfig: context.appRouter.config(),
          theme: theme,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('de'), // German
          ],
        ),
      ),
    );
  }
}
