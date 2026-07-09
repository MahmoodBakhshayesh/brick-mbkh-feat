import 'package:flutter/material.dart';

import '{{feature_name}}_view_phone.dart';

/// Tablet layout — starts as the phone layout; replace when a dedicated
/// tablet UI is needed.
class {{#pascalCase}}{{feature_name}}{{/pascalCase}}ViewTablet extends StatelessWidget {
  const {{#pascalCase}}{{feature_name}}{{/pascalCase}}ViewTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const {{#pascalCase}}{{feature_name}}{{/pascalCase}}ViewPhone();
  }
}
