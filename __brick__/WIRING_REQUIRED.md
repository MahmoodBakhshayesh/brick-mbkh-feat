# Wiring Checklist (MBKH)

Feature: `{{feature_name}}`

Generated files include `lib/features/{{feature_name}}/{{feature_name}}_di.dart`.

> **Automatic wiring:** the brick's `post_gen` hook wires steps **1** and **2**
> for you (route name, router entry, DI registrar) using the `// mbkh_feat:*`
> anchors in the host app. The steps below are the manual fallback — only
> needed if the hook logged a warning (e.g. output dir was not the app root,
> or the app was generated before the anchors existed).

## 1. Routes (automated)

`lib/core/navigation/app_route_names.dart`

```dart
static const String {{#camelCase}}{{feature_name}}{{/camelCase}} = '{{feature_name}}';
```

`lib/core/navigation/router_provider.dart`

```dart
import '../../features/{{feature_name}}/{{feature_name}}_view.dart';

GoRoute(
  path: '/{{feature_name}}',
  name: AppRouteNames.{{#camelCase}}{{feature_name}}{{/camelCase}},
  builder: (context, state) => const {{#pascalCase}}{{feature_name}}{{/pascalCase}}View(),
),
```

## 2. DI (automated) — `lib/core/di/generated_features_di.dart`

```dart
import '../../features/{{feature_name}}/{{feature_name}}_di.dart';

void registerGeneratedFeatureDependencies(GetIt locator) {
  register{{#pascalCase}}{{feature_name}}{{/pascalCase}}Dependencies(locator);
}
```

`app_features_di.dart` already calls `registerGeneratedFeatureDependencies(locator)`.

## 3. Localization (manual, optional)

If the phone view uses `context.localizations`, add ARB keys to `lib/l10n/app_en.arb` and `app_fa.arb`.

## 4. API path (manual)

Update `{{feature_name}}_data_source_remote.dart` with the real endpoint and HTTP verb.
