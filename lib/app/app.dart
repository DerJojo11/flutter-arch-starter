import 'package:bau_recht/app/routes/app_router.dart';
import 'package:bau_recht/shared/get_it.dart';
import 'package:bau_recht/shared/theme/blocs/theme/theme_bloc.dart';
import 'package:bau_recht/shared/theme/extensions/gradient_extension.dart';
import 'package:bau_recht/shared/theme/widgets/app_theme.dart';
import 'package:flutter/material.dart';
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
          routerConfig: getIt<AppRouter>().config(),
          theme: theme,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('de'), // German
          ],
          builder: (context, child) => DecoratedBox(
            decoration: BoxDecoration(
              gradient: Theme.of(context).extension<AppGradients>()?.background,
            ),
            child: child ?? const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
