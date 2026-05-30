import '../../../../core/helpers/api_service.dart';
import '../../../../di.dart';
import '../../usecases/{{usecase_action}}_{{entity_name}}_usecase.dart';
import '../entities/{{entity_name}}_class.dart';
import '../interfaces/{{feature_name}}_data_source_interface.dart';

class {{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceRemote implements {{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceInterface {
  final ApiService _api = locator.get<ApiService>();

  @override
  Future<{{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Response> {{#camelCase}}{{usecase_action}}{{/camelCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}(
    {{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Request request,
  ) async {
    final res = await _api.post('/{{feature_name}}/{{usecase_action}}', body: request.toJson());
    final data = {{#pascalCase}}{{entity_name}}{{/pascalCase}}.fromJson(Map<String, dynamic>.from(res.data['Body']['Response'] as Map));
    return {{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Response(success: true, message: 'Done', data: data);
  }
}
