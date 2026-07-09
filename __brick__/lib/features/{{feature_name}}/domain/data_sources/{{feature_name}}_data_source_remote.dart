import 'package:{{project_name}}/features/{{feature_name}}/usecases/{{usecase_action}}_{{entity_name}}_usecase.dart';

import '../../../../core/interfaces/base_data_source.dart';
import '../entities/{{entity_name}}_class.dart';
import '../interfaces/{{feature_name}}_data_source_interface.dart';

class {{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceRemote extends RemoteDataSource implements {{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceInterface {
  {{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceRemote(super.apiService);

  @override
  Future<{{#pascalCase}}{{entity_name}}{{/pascalCase}}?> {{#camelCase}}{{usecase_action}}{{/camelCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}(
    {{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Request request,
  ) async {
    // TODO: set the correct API path and verb (get/post/patch/delete).
    final nr = await apiService.get(
      '{{feature_name}}',
      enableLogs: true,
    );
    return parseBodyObjectOrNull(nr, {{#pascalCase}}{{entity_name}}{{/pascalCase}}.fromJson);
  }
}
