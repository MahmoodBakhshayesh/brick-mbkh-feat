import 'package:flutter/material.dart';

class {{#pascalCase}}{{feature_name}}{{/pascalCase}}ViewPhone extends StatelessWidget {
  const {{#pascalCase}}{{feature_name}}{{/pascalCase}}ViewPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('{{#titleCase}}{{feature_name}}{{/titleCase}}')),
      body: const Center(child: Text('Feature ready')),
    );
  }
}
