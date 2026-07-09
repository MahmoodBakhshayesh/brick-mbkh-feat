import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
        builder: (data) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              Text(data?.name ?? ''),
              if (data?.description != null) Text(data!.description!),
            ],
          ),
        ),
      ),
    );
  }

  // Form inputs use the `unified_fields` package through the per-app
  // decoration factory (lib/widgets/inputs/{{project_name}}_field_decoration.dart):
  //
  //   {{#pascalCase}}{{project_name}}{{/pascalCase}}FieldDecoration.textField(
  //     label: 'Name',
  //     controller: nameController,
  //     validator: FieldsValidators.notEmptyString,
  //   )
  //
  //   {{#pascalCase}}{{project_name}}{{/pascalCase}}FieldDecoration.singlePicker<{{#pascalCase}}{{entity_name}}{{/pascalCase}}>(
  //     label: '{{#pascalCase}}{{entity_name}}{{/pascalCase}}',
  //     items: items,
  //     value: selected,
  //     onChanged: (value) {},
  //   )
}
