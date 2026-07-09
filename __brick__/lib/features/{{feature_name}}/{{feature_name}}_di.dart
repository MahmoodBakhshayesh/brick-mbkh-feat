import 'package:get_it/get_it.dart';
import 'package:{{project_name}}/core/helpers/di_feature_stack.dart';
import 'package:{{project_name}}/features/{{feature_name}}/domain/data_sources/{{feature_name}}_data_source_local.dart';
import 'package:{{project_name}}/features/{{feature_name}}/domain/data_sources/{{feature_name}}_data_source_remote.dart';
import 'package:{{project_name}}/features/{{feature_name}}/domain/repositories/{{feature_name}}_repository.dart';
import 'package:{{project_name}}/features/{{feature_name}}/usecases/{{usecase_action}}_{{entity_name}}_usecase.dart';

void register{{#pascalCase}}{{feature_name}}{{/pascalCase}}Dependencies(GetIt locator) {
  registerFeatureStack<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceLocal, {{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceRemote, {{#pascalCase}}{{feature_name}}{{/pascalCase}}Repository>(
    locator: locator,
    name: '{{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSource',
    createLocal: (l) => {{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceLocal(l()),
    createRemote: (l) => {{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceRemote(l()),
    createRepository: {{#pascalCase}}{{feature_name}}{{/pascalCase}}Repository.builder,
  );

  locator.registerLazySingleton(() => {{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Usecase(locator()));
}
