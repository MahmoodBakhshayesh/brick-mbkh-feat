import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../widgets/async_provider_widget.dart';
import '../../../widgets/feature_app_bar.dart';
import '../{{feature_name}}_state.dart';
import '../domain/entities/{{entity_name}}_class.dart';

class {{#pascalCase}}{{feature_name}}{{/pascalCase}}ViewPhone extends ConsumerWidget {
  const {{#pascalCase}}{{feature_name}}{{/pascalCase}}ViewPhone({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: FeatureAppBar(title: '{{#pascalCase}}{{feature_name}}{{/pascalCase}}'),
      body: AsyncProviderWidget<{{#pascalCase}}{{entity_name}}{{/pascalCase}}>(
        provider: async{{#pascalCase}}{{entity_name}}{{/pascalCase}}Provider,
        builder: (data) => Center(child: Text(data?.name??'')),
      ),
    );
  }
}
