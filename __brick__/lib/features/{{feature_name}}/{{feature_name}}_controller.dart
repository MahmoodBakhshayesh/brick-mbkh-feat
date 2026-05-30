import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'usecases/{{usecase_action}}_{{entity_name}}_usecase.dart';

final {{#camelCase}}{{feature_name}}{{/camelCase}}ControllerProvider = Provider.autoDispose<{{#pascalCase}}{{feature_name}}{{/pascalCase}}Controller>(
  (ref) => {{#pascalCase}}{{feature_name}}{{/pascalCase}}Controller(ref),
);

class {{#pascalCase}}{{feature_name}}{{/pascalCase}}Controller {
  final Ref ref;
  {{#pascalCase}}{{feature_name}}{{/pascalCase}}Controller(this.ref);

  Future<void> {{#camelCase}}{{usecase_action}}{{/camelCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}() async {
    // TODO wire request params then call usecase.
  }
}
