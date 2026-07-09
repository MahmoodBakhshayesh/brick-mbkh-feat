import 'package:flutter/material.dart';

import '{{feature_name}}_view_phone.dart';

/// Desktop layout — starts as the phone layout; replace when a dedicated
/// desktop UI is needed.
class {{#pascalCase}}{{feature_name}}{{/pascalCase}}ViewDesktop extends StatelessWidget {
  const {{#pascalCase}}{{feature_name}}{{/pascalCase}}ViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const {{#pascalCase}}{{feature_name}}{{/pascalCase}}ViewPhone();
  }
}
