import '../../../core/interfaces/base_result.dart';
import '../../../core/interfaces/base_usecase.dart';
import '../domain/entities/{{entity_name}}_class.dart';
import '../domain/repositories/{{feature_name}}_repository.dart';

class {{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Request extends Request {
  final String? id;

  {{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Request({this.id});

  @override
  Failure? validate() => null;

  @override
  Map<String, dynamic> toJson() => Request.apiEnvelope({'ID': id});
}

class {{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Response extends UseCaseResponse {
  final {{#pascalCase}}{{entity_name}}{{/pascalCase}}? {{#camelCase}}{{entity_name}}{{/camelCase}}Data;

  {{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Response({
    super.success,
    this.{{#camelCase}}{{entity_name}}{{/camelCase}}Data,
    super.message,
    super.error,
  });
}

class {{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Usecase
    extends RepositoryUseCase<{{#pascalCase}}{{entity_name}}{{/pascalCase}}, {{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Response, {{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Request> {
  final {{#pascalCase}}{{feature_name}}{{/pascalCase}}Repository _repository;

  {{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Usecase(this._repository);

  @override
  Future<{{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Response> fetchFromRepository(
    {{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Request request,
  ) =>
      _repository.{{#camelCase}}{{usecase_action}}{{/camelCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}(request);

  @override
  {{#pascalCase}}{{entity_name}}{{/pascalCase}}? dataFromResponse(
    {{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Response response,
  ) =>
      response.{{#camelCase}}{{entity_name}}{{/camelCase}}Data;
}
