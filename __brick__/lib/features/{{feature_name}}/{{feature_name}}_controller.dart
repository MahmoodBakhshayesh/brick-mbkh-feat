import '../../core/controllers/base_controller.dart';
import '../../core/helpers/use_case_runner.dart';
import '../../di.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'domain/entities/{{entity_name}}_class.dart';
import 'usecases/{{usecase_action}}_{{entity_name}}_usecase.dart';

final {{#camelCase}}{{feature_name}}{{/camelCase}}ControllerProvider = Provider.autoDispose((ref) {
  final controller = {{#pascalCase}}{{feature_name}}{{/pascalCase}}Controller(ref);
  ref.onDispose(() => controller.dispose());
  return controller;
});

class {{#pascalCase}}{{feature_name}}{{/pascalCase}}Controller extends BaseController {
  {{#pascalCase}}{{feature_name}}{{/pascalCase}}Controller(super.ref);

  Future<{{#pascalCase}}{{entity_name}}{{/pascalCase}}> {{#camelCase}}{{usecase_action}}{{/camelCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}() async {
    return runUseCase(
      locator<{{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Usecase>(),
      {{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Request(),
    );
  }
}
