import 'package:flutter/material.dart';
import 'presentation/{{feature_name}}_view_phone.dart';

class {{#pascalCase}}{{feature_name}}{{/pascalCase}}View extends StatelessWidget {
  const {{#pascalCase}}{{feature_name}}{{/pascalCase}}View({super.key});

  @override
  Widget build(BuildContext context) {
    return const {{#pascalCase}}{{feature_name}}{{/pascalCase}}ViewPhone();
  }
}
