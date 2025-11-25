# Flutter Architecture Starter Template (WIP) [![codecov](https://codecov.io/gh/DerJojo11/flutter-arch-starter/branch/main/graph/badge.svg)](https://codecov.io/gh/DerJojo11/flutter-arch-starter)


Mein „Opinionated“ Flutter-Template mit klaren Layern, neutraler Lokalisierung, DI, Routing und State-Management – ready to code.

Repo: flutter-arch-starter
Stack: Flutter, AutoRoute, get_it + injectable, Bloc, Freezed, gen_l10n

## Features

- 🔧 **Klare Projektstruktur**
  - `app/` – Composition Root (Router, DI, App-Wiring)
  - `features/` – Fachbereiche / Screens / Business-Logik
  - `shared/` – wiederverwendbare, feature-unabhängige Bausteine
  - `l10n/` – neutrale Übersetzungen (gen_l10n)
- 🧭 **Routing mit AutoRoute**
  - typisierte Routen
  - `MaterialApp.router` Setup
- 🧩 **Dependency Injection**
  - `get_it` als Service Locator
  - `injectable` für Codegenerierung
- 🔄 **State Management mit Bloc**
  - `flutter_bloc`
  - Test-Setup mit `bloc_test` + `mocktail`
- ❄️ **Freezed**
  - Models & Unions
- 🌐 **Lokalisierung via gen_l10n**
  - zentrale ARB-Files
- ✅ **Custom Lints**
  - erzwingen Layer-Regeln:
    - `shared` bleibt unabhängig
    - Features kennen sich untereinander nicht
- 🧪 **CI-ready**
  - vorbereitete GitHub Action (u. a. für Tests / Coverage)


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
main.dart                  # App-Start
```

## Layer-Regeln (durch Custom-Lint enforced)
1. #### shared/ ist unabhängig
- Darf NICHT importieren:
  - lib/app/...
  - lib/features/...
- Darf importieren:
  - lib/shared/...
  - Flutter / 3rd-Party Packages
  - lib/l10n/... (falls benötigt)
- 👉 shared ist deine Werkzeugkiste: Farben, Theme, Widgets, Extensions, Utils.
Die Werkzeugkiste weiß nicht, wer sie benutzt.
2. #### Features kennen sich nicht untereinander
- Files in lib/features/<featureName>/... dürfen:
  - ✅ lib/shared/... importieren
  - ✅ lib/app/... importieren (z. B. Router-Extension, Routen)
  - ❌ KEINE anderen Features importieren, also kein:
  -lib/features/otherFeature/...
- 👉 Jedes Feature ist ein Fachbereich (Home, Settings, Auth, …). Wenn zwei Features etwas gemeinsam brauchen, gehört es nach shared/.
3. #### app/ ist der Master / Composition Root
- lib/app/... darf alles importieren: shared/, features/, l10n/
- Hier sitzt:
  - MyApp / MaterialApp.router
  - AutoRoute-Setup
  - DI (configureDependencies())
- 👉 app ist der Dirigent, der alles zusammensetzt.


## Getting Started

Dieses Template nutzt [FVM](https://fvm.app), um die Flutter-Version zu fixieren.
Die verwendete Flutter-Version steht in der Datei [.fvmrc](.fvmrc).
1. #### Flutter-Version via FVM setzen
```bash
fvm use
```

(Installiert / aktiviert die Version aus .fvmrc.)
 
2. #### Package-Namen anpassen
In pubspec.yaml:
```yaml
name: flutter_arch_starter # <-- TODO rename after using the template
```
`name`: auf deinen Wunsch-Paketnamen ändern.  
Alle `package:flutter_arch_starter/...` Imports via Search & Replace anpassen.

3. #### Dependencies installieren
```bash
flutter pub get
```
oder per dart:
```bash
dart pub get
```

4. #### Codegenerierung (AutoRoute, Freezed, Injectable)
```bash
dart run build_runner build --delete-conflicting-outputs
```
5. App starten
```bash
flutter run
```
oder über VsCode [launch.json](.vscode/launch.json).

## Lokalisierung (l10n)
- ARB-Dateien liegen unter:
```
lib/l10n/arb/
  app_en.arb
  app_de.arb
  ...
```
- Generierter Code landet in:

```
lib/l10n/generated/
  app_localizations.dart
  ...
```
- Typischer Import (überall erlaubt: app, features, shared):
```dart
import 'package:dein_package_name/l10n/generated/app_localizations.dart';

final text = context.l10n.homeTitle;
```

MaterialApp.router ist bereits mit Delegates/Locales verdrahtet.

## Routing (AutoRoute)

- Konfiguration in `lib/app/routes/app_router.dart`
- Generierter Code: `app_router.gr.dart` (via build_runner)

Zugriff im Widget über GetIt, damit Mocken im Test gewährleistet wird:
```dart
    context.appRouter.push(const ExampleDetailsRoute(id: '42'));
```


## Dependency Injection

- Composition Root: [injectable/](lib/app/injectable/) (Registrierung via @injectable + configureDependencies())
- Globaler Locator in [getIt.dart](lib/shared/get_it.dart):

In Tests pro Suite Scope setzen & Mocks registrieren:
```dart
setUp(() {
  getIt.registerSingleton<MyRepo>(MockRepo());
});
```
Ein Reset ist nicht von nöten, da es eine globale Test Config gibt.


## State-Management ([Bloc](https://pub.dev/packages/flutter_bloc))

Dieses Template geht von flutter_bloc als State-Management aus.
Bloc, Cubit etc. liegen typischerweise in den jeweiligen Features:
`lib/features/example/presentation/bloc/...`  

Tests mit bloc_test + mocktail sind vorgesehen.   
Die offizielle Doku & Beispiele findest du hier:   
- Bloc-Package: https://pub.dev/packages/flutter_bloc.  
- Doku: https://bloclibrary.dev

## [Freezed](https://pub.dev/packages/freezed)

- Models/Unions via freezed_annotation + freezed
- Generator läuft mit build_runner

## Custom Lints (custom_lint + my_app_lints)
Dieses Template bringt ein eigenes Lint-Package mit ([packages/my_app_lints](packages/my_app_lints/)), das via [custom_lint](https://pub.dev/packages/custom_lint) eingebunden ist.   

Aktuell enforced es:
- shared ist unabhängig
  - Files in lib/shared/... dürfen keine Imports auf lib/app/... oder lib/features/... haben.  

  Ziel: shared/ bleibt wiederverwendbar und cyclen-frei.

- Features kennen sich nicht
  - Files in lib/features/<featureName>/... dürfen nicht lib/features/<anderesFeatureName>/... importieren.

  Import ins eigene Feature (relativ oder package:.../features/<featureName>/...) ist erlaubt.  
  Ziel: Features bleiben modular; geteilte Logik wandert nach shared/.  
  app/ wird durch die Lints bewusst nicht eingeschränkt – es ist der Composition Root und darf alles kennen.

- Desweiteren ist durch die Regel `SpecifyTypeInFields` es verpflichtend, einen Typ zu setzen.
- Lints im Terminal ausführen:
  ```bash
  dart run custom_lint
  ```

## About
Dieses Template ist Work in Progress und bewusst “mein persönlicher Stil” für Flutter-Architektur:
- klare Struktur
- sinnvolle, aber nicht übertriebene Abstraktionen
- Custom-Lints, die helfen, das Projekt langfristig sauber zu halten
- trotzdem pragmatisch genug, um AutoRoute & Co. nicht kaputt zu designen

Feedback, Issues und PRs sind jederzeit willkommen. ✌️