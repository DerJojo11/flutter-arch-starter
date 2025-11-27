import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:my_app_lints/lints/layer_imports_rule.dart';
import 'package:my_app_lints/lints/specify_types_in_fields.dart';

PluginBase createPlugin() => MyAppLints();

class MyAppLints extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        const SpecifyTypeInFields(),
        const LayerImportsRule(),
      ];
}
