import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'domain/entities/{{entity_name}}_class.dart';
import '{{feature_name}}_controller.dart';

final async{{#pascalCase}}{{entity_name}}{{/pascalCase}}Provider = FutureProvider.autoDispose<{{#pascalCase}}{{entity_name}}{{/pascalCase}}>((ref) {
  final controller = ref.read({{#camelCase}}{{feature_name}}{{/camelCase}}ControllerProvider);
  return controller.{{#camelCase}}{{usecase_action}}{{/camelCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}();
});
