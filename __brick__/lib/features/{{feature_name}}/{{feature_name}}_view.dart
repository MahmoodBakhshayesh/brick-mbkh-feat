import 'package:flutter/material.dart';

import '/core/extensions/context_extension.dart';
import 'presentation/{{feature_name}}_view_desktop.dart';
import 'presentation/{{feature_name}}_view_phone.dart';
import 'presentation/{{feature_name}}_view_tablet.dart';

class {{#pascalCase}}{{feature_name}}{{/pascalCase}}View extends StatelessWidget {
  const {{#pascalCase}}{{feature_name}}{{/pascalCase}}View({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.isDesktop) {
      return const {{#pascalCase}}{{feature_name}}{{/pascalCase}}ViewDesktop();
    }
    if (context.isMyTablet) {
      return const {{#pascalCase}}{{feature_name}}{{/pascalCase}}ViewTablet();
    }
    return const {{#pascalCase}}{{feature_name}}{{/pascalCase}}ViewPhone();
  }
}
