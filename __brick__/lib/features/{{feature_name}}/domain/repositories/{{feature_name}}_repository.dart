import '../../../../core/helpers/error_message_formatter.dart';
import '../../usecases/{{usecase_action}}_{{entity_name}}_usecase.dart';
import '../data_sources/{{feature_name}}_data_source_remote.dart';
import '../interfaces/{{feature_name}}_repository_interface.dart';

class {{#pascalCase}}{{feature_name}}{{/pascalCase}}Repository implements {{#pascalCase}}{{feature_name}}{{/pascalCase}}RepositoryInterface {
  final {{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceRemote remoteDataSource;
  {{#pascalCase}}{{feature_name}}{{/pascalCase}}Repository(this.remoteDataSource);

  @override
  Future<{{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Response> {{#camelCase}}{{usecase_action}}{{/camelCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}(
    {{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Request request,
  ) async {
    try {
      return await remoteDataSource.{{#camelCase}}{{usecase_action}}{{/camelCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}(request);
    } catch (e, st) {
      return {{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Response(
        success: false,
        message: ErrorMessageFormatter.format(e, st),
      );
    }
  }
}
