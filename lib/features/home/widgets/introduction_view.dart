import 'package:bau_recht/shared/extensions/edge_insets_extension.dart';
import 'package:bau_recht/shared/extensions/widget_extension.dart';
import 'package:bau_recht/shared/theme/tokens/spacings.dart';
import 'package:flutter/material.dart';


class IntroductionView extends StatelessWidget {
  const IntroductionView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsetsExtension.padding(all: Spacings.medium),
        children: [
          Text(
            'Willkomen zurück 👋',
            style: Theme.of(context).textTheme.headlineSmall,
          ).withPadding(bottom: Spacings.small),
          Text(
            'Schön dich wiederzusehen!',
            style: Theme.of(context).textTheme.labelSmall,
          )
        ],
      );
  }
}