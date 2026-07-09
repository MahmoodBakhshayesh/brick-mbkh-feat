import 'package:{{project_name}}/core/helpers/use_case_response_mapper.dart';
import 'package:{{project_name}}/core/interfaces/base_repository.dart';
import 'package:{{project_name}}/features/{{feature_name}}/usecases/{{usecase_action}}_{{entity_name}}_usecase.dart';
import 'package:get_it/get_it.dart';

import '../data_sources/{{feature_name}}_data_source_local.dart';
import '../data_sources/{{feature_name}}_data_source_remote.dart';
import '../interfaces/{{feature_name}}_repository_interface.dart';

class {{#pascalCase}}{{feature_name}}{{/pascalCase}}Repository extends BaseRepository implements {{#pascalCase}}{{feature_name}}{{/pascalCase}}RepositoryInterface {
  final {{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceRemote remoteDataSource;
  final {{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceLocal localDataSource;

  {{#pascalCase}}{{feature_name}}{{/pascalCase}}Repository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  static {{#pascalCase}}{{feature_name}}{{/pascalCase}}Repository builder() {
    return {{#pascalCase}}{{feature_name}}{{/pascalCase}}Repository(
      remoteDataSource: GetIt.instance.get(instanceName: '{{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceRemote'),
      localDataSource: GetIt.instance.get(instanceName: '{{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceLocal'),
    );
  }

  @override
  Future<{{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Response> {{#camelCase}}{{usecase_action}}{{/camelCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}(
    {{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Request request,
  ) {
    return mapUseCaseResponse(
      () => remoteDataSource.{{#camelCase}}{{usecase_action}}{{/camelCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}(request),
      onSuccess: (data) => {{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Response({{#camelCase}}{{entity_name}}{{/camelCase}}Data: data),
      create: {{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Response.new,
    );
  }
}
