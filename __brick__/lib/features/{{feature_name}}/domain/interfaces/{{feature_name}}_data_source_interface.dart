import '../../usecases/{{usecase_action}}_{{entity_name}}_usecase.dart';

abstract class {{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceInterface {
  Future<{{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Response> {{#camelCase}}{{usecase_action}}{{/camelCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}(
    {{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Request request,
  );
}
