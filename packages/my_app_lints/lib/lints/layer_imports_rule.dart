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
    correctionMessage: 'Regeln: shared ist unabhängig, Features kennen sich nicht gegenseitig.',
    errorSeverity: DiagnosticSeverity.ERROR,
  );

  @override
  void run(
    CustomLintResolver resolver,
    DiagnosticReporter reporter,
    CustomLintContext context,
  ) {
    final rawPath = resolver.source.fullName;
    final path = rawPath.replaceAll(r'\', '/'); // Windows-safe

    final layerInfo = _detectLayer(path);
    if (layerInfo == null) return;

    final layer = layerInfo.layer;
    final featureName = layerInfo.featureName;

    context.registry.addImportDirective((ImportDirective node) {
      final uri = node.uri.stringValue;
      if (uri == null) return;

      final violation = _checkViolation(
        layer: layer,
        featureName: featureName,
        uri: uri,
      );
      if (violation == null) return;

      final code = LintCode(
        name: _baseCode.name,
        problemMessage: violation,
        correctionMessage: _baseCode.correctionMessage,
        errorSeverity: _baseCode.errorSeverity,
      );

      reporter.atNode(node.uri, code);
    });
  }

  /// Erkennt Layer + ggf. Feature-Namen anhand des Dateipfads.
  _LayerInfo? _detectLayer(String path) {
    final libIndex = path.indexOf('/lib/');
    if (libIndex == -1) return null;

    final relative = path.substring(libIndex + '/lib/'.length);

    if (relative.startsWith('shared/')) {
      return _LayerInfo(layer: 'shared');
    }

    if (relative.startsWith('features/')) {
      // Struktur: features/<featureName>/...
      final rest = relative.substring('features/'.length);
      final slashIndex = rest.indexOf('/');
      if (slashIndex == -1) return _LayerInfo(layer: 'features');

      final featureName = rest.substring(0, slashIndex);
      return _LayerInfo(layer: 'features', featureName: featureName);
    }

    if (relative.startsWith('app/')) {
      return _LayerInfo(layer: 'app');
    }

    // Alles andere (z.B. l10n) ignorieren wir
    return null;
  }

  /// Prüft anhand des Layers, ob die Import-URI erlaubt ist.
  ///
  /// null = ok, String = Fehlermeldung
  String? _checkViolation({
    required String layer,
    required String? featureName,
    required String uri,
  }) {
    // Dart/Flutter/3rd-Party sind immer ok.
    if (uri.startsWith('dart:') ||
        uri.startsWith('package:flutter/') ||
        (uri.startsWith('package:') &&
            !uri.contains('/app/') &&
            !uri.contains('/shared/') &&
            !uri.contains('/features/')) ||
        uri.startsWith('flutter:')) {
      return null;
    }

    // Relative Importe sind ok (innerhalb desselben Packages/Features).
    if (uri.startsWith('./') || uri.startsWith('../')) {
      return null;
    }

    final importsApp = uri.contains('/app/');
    final importsShared = uri.contains('/shared/');
    final importsFeatures = uri.contains('/features/');

    switch (layer) {
      case 'shared':
        // shared darf weder app noch features importieren
        if (importsApp || importsFeatures) {
          return 'lib/shared/ ist unabhängig und darf weder lib/app/ '
              'noch lib/features/ importieren.';
        }
        return null;

      case 'features':
        // Features dürfen shared importieren
        if (importsShared) return null;

        // Features dürfen app importieren (für Router etc.)
        if (importsApp) return null;

        // Features dürfen KEINE anderen Features importieren
        if (importsFeatures) {
          // Wenn wir den Feature-Namen kennen, prüfen wir, ob es ein anderes ist
          if (featureName != null) {
            final selfPattern = '/features/$featureName/';
            final isSelf = uri.contains(selfPattern);
            if (!isSelf) {
              return 'Files in lib/features/$featureName/ dürfen keine '
                  'anderen Features unter lib/features/... importieren.';
            }
            // Import ins eigene Feature ist ok
            return null;
          }

          // Fallback: wenn wir Layer "features" kennen, aber keinen Namen,
          // verbieten wir vorsichtshalber alle Feature-Imports.
          return 'Files in lib/features/ dürfen keine anderen '
              'Features unter lib/features/... importieren.';
        }

        return null;

      case 'app':
        // app ist unser Composition Root – keine Einschränkungen
        return null;
    }

    return null;
  }
}

class _LayerInfo {
  _LayerInfo({
    required this.layer,
    this.featureName,
  });

  final String layer;
  final String? featureName;
}
