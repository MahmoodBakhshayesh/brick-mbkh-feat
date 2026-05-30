import '../../usecases/{{usecase_action}}_{{entity_name}}_usecase.dart';
import '../interfaces/{{feature_name}}_data_source_interface.dart';

class {{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceLocal implements {{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceInterface {
  @override
  Future<{{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Response> {{#camelCase}}{{usecase_action}}{{/camelCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}(
    {{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Request request,
  ) {
    throw UnimplementedError();
  }
}
