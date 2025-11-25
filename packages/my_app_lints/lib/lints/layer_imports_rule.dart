// lib/src/layer_imports_rule.dart
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/error.dart' show DiagnosticSeverity;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class LayerImportsRule extends DartLintRule {
  const LayerImportsRule() : super(code: _baseCode);
  static const _baseCode = LintCode(
    name: 'invalid_layer_import',
    problemMessage: 'Ungültiger Import zwischen app/shared/features.',
    correctionMessage: 'Halte dich an die Layer-Regeln: '
        'app → shared/features, features → shared, shared → nichts.',
    errorSeverity: DiagnosticSeverity.ERROR,
  );

  @override
  void run(
    CustomLintResolver resolver,
    DiagnosticReporter reporter,
    CustomLintContext context,
  ) {
    final rawPath = resolver.source.fullName;
    final path = rawPath.replaceAll(r'\', '/'); // Windows safe

    final layer = _detectLayer(path);
    if (layer == null) return;

    // Statt resolver.unit + manueller Schleife:
    context.registry.addImportDirective((ImportDirective node) {
      final uri = node.uri.stringValue;
      if (uri == null) return;

      final violation = _checkViolation(layer, uri);
      if (violation == null) return;

      final code = LintCode(
        name: _baseCode.name,
        problemMessage: violation,
        correctionMessage: _baseCode.correctionMessage,
        errorSeverity: _baseCode.errorSeverity,
      );

      // custom_lint-extension: markiere exakt die URI
      reporter.atNode(node.uri, code);
    });
  }

  /// Erkennt anhand des Dateipfads, in welchem Layer wir uns befinden.
  /// Erwartet:
  ///   lib/app/...
  ///   lib/shared/...
  ///   lib/features/...
  String? _detectLayer(String path) {
    final libIndex = path.indexOf('/lib/');
    if (libIndex == -1) return null;

    final relative = path.substring(libIndex + '/lib/'.length);

    if (relative.startsWith('app/')) return 'app';
    if (relative.startsWith('shared/')) return 'shared';
    if (relative.startsWith('features/')) return 'features';

    return null;
  }

  /// Prüft anhand des Layers, ob die Import-URI erlaubt ist.
  ///
  /// null = alles ok
  /// String = Fehlermeldung
  String? _checkViolation(String layer, String uri) {
    // Dart/Flutter/3rd-Party-Pakete sind immer ok.
    if (uri.startsWith('dart:') ||
        uri.startsWith('package:flutter/') ||
        (uri.startsWith('package:') &&
            !uri.contains('/app/') &&
            !uri.contains('/shared/') &&
            !uri.contains('/features/')) ||
        uri.startsWith('flutter:')) {
      return null;
    }

    // Relative Importe (innerhalb des gleichen Layers/Features) sind ok.
    if (uri.startsWith('./') || uri.startsWith('../')) {
      return null;
    }

    // Interne Package-Imports:
    final importsApp = uri.contains('/app/');
    final importsShared = uri.contains('/shared/');
    final importsFeatures = uri.contains('/features/');

    switch (layer) {
      case 'app':
        // app darf shared & features importieren
        return null;

      case 'shared':
        if (importsApp || importsFeatures) {
          return 'Files in lib/shared/ dürfen weder lib/app/ noch lib/features/ importieren.';
        }
        return null;

      case 'features':
        // features darf shared, aber kein app
        if (importsApp) {
          return 'Files in lib/features/ dürfen lib/app/ nicht importieren.';
        }

        // Strenge Variante: Feature → Feature verbieten
        if (importsFeatures) {
          return 'Files in lib/features/ sollten keine anderen Features '
              'per package-Import referenzieren. '
              'Extrahiere gemeinsamen Code nach lib/shared/.';
        }

        // shared-Import ist ok
        if (importsShared) return null;

        return null;
    }

    return null;
  }
}
