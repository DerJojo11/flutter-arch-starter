import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/diagnostic/diagnostic.dart';
import 'package:analyzer/error/listener.dart';
import 'package:analyzer/source/source_range.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

/// Lint rule to always specify types for fields.
///
/// There is a default lint rule: 'always_specify_types' that checks for all variables. But also forces you to add types
/// to places where it is not necessary (Generics for example).
class SpecifyTypeInFields extends DartLintRule {
  /// Default constructor
  const SpecifyTypeInFields() : super(code: _code);

  /// Metadata about the warning that will show-up in the IDE.
  /// This is used for `// ignore: code` and enabling/disabling the lint
  static const LintCode _code = LintCode(
    name: 'specify_type_in_fields',
    problemMessage: 'Always specify types for fields.',
    correctionMessage: 'Specifying types for fields improves code clarity and safety.',
  );

  @override
  void run(CustomLintResolver resolver, DiagnosticReporter reporter, CustomLintContext context) {
    context.registry.addVariableDeclarationList((node) {
      if (node.type == null) {
        reporter.atNode(node, _code);
      }
    });
  }

  // Possible fixes for the lint error go here
  @override
  List<Fix> getFixes() => [
        AddTypeFix(),
      ];
}

/// A fix for the `SpecifyTypeInFields` lint.
class AddTypeFix extends DartFix {
  @override
  void run(CustomLintResolver resolver, ChangeReporter reporter, CustomLintContext context, Diagnostic analysisError,
      List<Diagnostic> others) {
    context.registry.addVariableDeclarationList((VariableDeclarationList node) {
      if (node.type != null) {
        return;
      }

      final ChangeBuilder changeBuilder = reporter.createChangeBuilder(
        message: 'Add type annotation',
        priority: 1,
      );

      for (final variable in node.variables) {
        final String? type = variable.initializer?.staticType?.toString();

        // `return` if the current method is not where the lint
        // error has appeared
        final SourceRange sourceRange = SourceRange(
          variable.offset,
          variable.length,
        );

        if (!analysisError.sourceRange.intersects(sourceRange)) {
          continue;
        }

        changeBuilder.addDartFileEdit((builder) {
          builder.addSimpleInsertion(
            variable.offset,
            '$type ',
          );
        });
      }
    });
  }
}
