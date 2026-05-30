# Wiring Checklist (MBKH)

Feature: `{{feature_name}}`

## 1. Routes

`lib/core/navigation/app_route_names.dart`

```dart
static const {{#camelCase}}{{feature_name}}{{/camelCase}} = '{{feature_name}}';
```

`lib/core/navigation/router_provider.dart`

```dart
GoRoute(
  path: '/${AppRouteNames.{{#camelCase}}{{feature_name}}{{/camelCase}}}',
  name: AppRouteNames.{{#camelCase}}{{feature_name}}{{/camelCase}},
  builder: (context, state) => const {{#pascalCase}}{{feature_name}}{{/pascalCase}}View(),
),
```

## 2. DI (`lib/di.dart`)

Import data sources, repository, and use case. Then register the feature stack:

```dart
registerFeatureStack<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceLocal, {{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceRemote, {{#pascalCase}}{{feature_name}}{{/pascalCase}}Repository>(
  locator: locator,
  name: '{{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSource',
  createLocal: (l) => {{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceLocal(l()),
  createRemote: (l) => {{#pascalCase}}{{feature_name}}{{/pascalCase}}DataSourceRemote(l()),
  createRepository: {{#pascalCase}}{{feature_name}}{{/pascalCase}}Repository.builder,
);

locator.registerLazySingleton(() => {{#pascalCase}}{{usecase_action}}{{/pascalCase}}{{#pascalCase}}{{entity_name}}{{/pascalCase}}Usecase(locator()));
```

## 3. Localization (optional)

If the phone view uses `context.localizations`, add ARB keys for this feature.

## 4. API path

Update `{{feature_name}}_data_source_remote.dart` with the real endpoint and HTTP verb.
