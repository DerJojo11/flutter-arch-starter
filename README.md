# Flutter Architecture Starter Template (WIP)

Mein „Opinionated“ Flutter-Template mit klaren Layern, neutraler Lokalisierung, DI, Routing und State-Management – ready to code.

Repo: flutter-arch-starter
Stack: Flutter, AutoRoute, get_it + injectable, Bloc, Freezed, gen_l10n

## Features

- Saubere Layer: app/ (Composition Root), features/ (Domänen), shared/ (wiederverwendbar), l10n/ (neutrale Übersetzungen)
- Routing mit AutoRoute (typisierte Routen, MaterialApp.router)
- DI via get_it + injectable (Composition Root + Generator)
- State mit flutter_bloc (inkl. bloc_test + mocktail)
- Freezed für Models/Unions
- L10n: ein zentraler Satz ARB-Dateien unter lib/l10n/ (kein Import aus app/ nötig)
- CI-ready (GitHub Actions Workflow vorbereitet)

## Struktur

```perl
lib/
  app/                     # Composition Root: Router, DI, App-Wiring
    routes/                # AutoRoute-Konfiguration
    di/                    # injectable/get_it Registration
  features/
    example/               # Beispiel-Feature (Screens, State)
  l10n/
    arb/                   # Übersetzungen (Quelle)
    generated/             # generierter Code (AppLocalizations)
  shared/
    extensions/            # shared extensions
    theme/                 # Theme-Stubs, Tokens, ggf. Widgets
    router/                # shared router
main.dart                  # App-Start
```

## Layer-Regeln (Empfehlung):

- **app** → darf **shared, features, l10n** importieren
- **features** → darf nur **shared, l10n** importieren
- **shared** → darf nur **l10n** importieren

## Getting Started

In dem Template wird eine Flutter Version bereits gesetzt. Diese findest du in der [.fvmrc](.fvmrc). Damit FVM auch korrekt funktionert, vorher mit `fvm use` die Flutter Version installieren.

#### Bevor du die folgenden Befehle ausführt:

- In [pubspec.yaml](pubspec.yaml) name: auf deinen Package-Namen ändern!
- ggf. Imports von `package:flutter_arch_starter/` auf deinen Namen anpassen. Am besten mit **Search & Replace**.

```bash
# 1) Dependencies holen
flutter pub get

# 2) Codegen laufen lassen (AutoRoute, Freezed, Injectable)
dart run build_runner build -d

# 3) App starten, evtl mit `flutter create` Projekt erstellen.  
flutter run

```

## Lokalisierung (l10n)

- ARBs liegen unter `lib/l10n/arb/` (z. B. app_en.arb, app_de.arb)
- Der Generator schreibt nach `lib/l10n/generated/`
- Import überall (Features, Shared, App):
    ```dart 
    import 'package:flutter_arch_starter/l10n/generated/app_localizations.dart';
    ```
- In MaterialApp.router sind Delegates/Locales bereits verdrahtet.

Key-Namensräume (Best Practice):
```arb
{
  "homeTitle": "Welcome",
  "exampleTitle": "Example"
}
```

## Routing (AutoRoute)

- Konfiguration in `lib/app/routes/app_router.dart`
- Generierter Code: `app_router.gr.dart` (via build_runner)

Zugriff im Widget über GetIt, damit Mocken im Test gewährleistet wird:
```dart
    context.appRouter.push(const ExampleDetailsRoute(id: '42'));
```

Damit keine Abhängigkeit von AutorRoute sowie [app/](lib/app/) besteht, gibt es den [IRouter](lib/shared/router/i_router.dart). Ein Interface, was die gängigen Router Funktionen bereitstellt. In [app/](lib/app/) gibt es daraufhin einen [AppRouterAdapter](lib/app/routes/app_router_adapter.dart) der das Interface auf deinen Router mapped.

## Dependency Injection

- Composition Root: [injectable/](lib/app/injectable/) (Registrierung via @injectable + configureDependencies())
- Globaler Locator in [getIt.dart](lib/shared/get_it.dart):

In Tests pro Suite Scope setzen & Mocks registrieren:
```dart
setUp(() {
  getIt.registerSingleton<MyRepo>(MockRepo());
});

// Don't forget to tear down getIt.
tearDown(() async => getIt.reset());
```

## State-Management ([Bloc](https://pub.dev/packages/flutter_bloc))

Als State-Management wurde Bloc ausgewählt. Es ist, verglichen mit anderen Patterns, das leichteste sowie robusteste. Aufgrund seiner ausführlichen Dokumentation, sind in diesem Template keine Beispiele vorhanden. Diese findest du [hier](https://bloclibrary.dev/).

## [Freezed](https://pub.dev/packages/freezed)

- Models/Unions via freezed_annotation + freezed
- Generator läuft mit build_runner