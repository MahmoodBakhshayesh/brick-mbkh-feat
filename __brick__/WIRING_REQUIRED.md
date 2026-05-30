# Wiring Checklist (MBKH)

Feature: `{{#snakeCase}}{{feature_name}}{{/snakeCase}}`

Apply the following in existing project files:

1. `lib/core/navigation/app_route_names.dart`
   - Add route constant:
   - `static const {{#camelCase}}{{feature_name}}{{/camelCase}} = '{{#snakeCase}}{{feature_name}}{{/snakeCase}}';`

2. `lib/core/navigation/router_provider.dart`
   - Add route entry:
   - `GoRoute(path: '/${AppRouteNames.{{#camelCase}}{{feature_name}}{{/camelCase}}}', name: AppRouteNames.{{#camelCase}}{{feature_name}}{{/camelCase}}, builder: (context, state) => const {{#pascalCase}}{{feature_name}}{{/pascalCase}}View()),`

3. `lib/di.dart`
   - Register:
   - `{{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceLocal`
   - `{{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceRemote`
   - `{{#pascalCase}}{{feature_name}}{{/pascalCase}}Repository`
   - `{{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Usecase`
