import '../../usecases/{{usecase_action}}_{{entity_name}}_usecase.dart';
import '../entities/{{entity_name}}_class.dart';
import '../interfaces/{{feature_name}}_data_source_interface.dart';
import '../../../../core/interfaces/base_data_source.dart';

class {{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceLocal extends LocalDataSource implements {{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceInterface {
  {{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceLocal(super.keyValueStore);

  @override
  Future<{{#pascalCase}}{{entity_name}}{{/pascalCase}}?> {{#camelCase}}{{usecase_action}}{{/camelCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}(
    {{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Request request,
  ) {
    throw UnimplementedError();
  }
}
