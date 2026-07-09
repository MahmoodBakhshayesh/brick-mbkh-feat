import 'dart:io';

import 'package:mason/mason.dart';

/// Wires the generated feature into the host app automatically:
///
/// 1. Route name constant in `lib/core/navigation/app_route_names.dart`
/// 2. `GoRoute` entry (+ view import) in `lib/core/navigation/router_provider.dart`
/// 3. DI registrar (+ import) in `lib/core/di/generated_features_di.dart`
///
/// Insertion points are the `// mbkh_feat:*` anchor comments seeded by the
/// `mbkh_app` brick. For apps generated before those anchors existed the hook
/// falls back to structural heuristics, and if a file cannot be updated it
/// logs a warning so `WIRING_REQUIRED.md` can be followed manually.
void run(HookContext context) {
  final feature = (context.vars['feature_name'] as String).trim();
  final camel = _camelCase(feature);
  final pascal = _pascalCase(feature);
  final logger = context.logger;

  final wiredRouteName = _wireRouteName(logger, feature, camel);
  final wiredRoute = _wireRoute(logger, feature, camel, pascal);
  final wiredDi = _wireDi(logger, feature, pascal);

  if (wiredRouteName && wiredRoute && wiredDi) {
    logger.success(
      'Feature "$feature" wired: route name, router entry, and DI registrar. '
      'Remaining manual steps: ARB keys (if needed) and the real API endpoint.',
    );
  } else {
    logger.warn(
      'Feature "$feature" was only partially wired — '
      'see WIRING_REQUIRED.md for the remaining steps.',
    );
  }
}

// --- 1. app_route_names.dart -----------------------------------------------

bool _wireRouteName(Logger logger, String feature, String camel) {
  const path = 'lib/core/navigation/app_route_names.dart';
  const anchor = '// mbkh_feat:route-names';
  final line = "  static const String $camel = '$feature';";

  return _patchFile(
    logger: logger,
    path: path,
    skipIfContains: "String $camel =",
    apply: (content) {
      if (content.contains(anchor)) {
        return content.replaceFirst(anchor, '$line\n  $anchor'.trimLeft());
      }
      // Fallback: insert before the class's closing brace (last `}`).
      final index = content.lastIndexOf('}');
      if (index == -1) return null;
      return '${content.substring(0, index)}$line\n${content.substring(index)}';
    },
  );
}

// --- 2. router_provider.dart ------------------------------------------------

bool _wireRoute(Logger logger, String feature, String camel, String pascal) {
  const path = 'lib/core/navigation/router_provider.dart';
  const anchor = '// mbkh_feat:routes';
  final import = "import '../../features/$feature/${feature}_view.dart';";
  final route = '''
      GoRoute(
        path: '/$feature',
        name: AppRouteNames.$camel,
        builder: (context, state) => const ${pascal}View(),
      ),''';

  return _patchFile(
    logger: logger,
    path: path,
    skipIfContains: 'AppRouteNames.$camel,',
    apply: (content) {
      var updated = _withImport(content, import);
      if (updated == null) return null;
      if (updated.contains(anchor)) {
        return updated.replaceFirst(anchor, '${route.trimLeft()}\n      $anchor');
      }
      // Fallback: insert before the routes list terminator `],`.
      final index = updated.lastIndexOf('],');
      if (index == -1) return null;
      return '${updated.substring(0, index)}$route\n    ${updated.substring(index)}';
    },
  );
}

// --- 3. generated_features_di.dart ------------------------------------------

bool _wireDi(Logger logger, String feature, String pascal) {
  const path = 'lib/core/di/generated_features_di.dart';
  const anchor = '// mbkh_feat:registrars';
  final import = "import '../../features/$feature/${feature}_di.dart';";
  final call = '  register${pascal}Dependencies(locator);';

  return _patchFile(
    logger: logger,
    path: path,
    skipIfContains: 'register${pascal}Dependencies(',
    apply: (content) {
      var updated = _withImport(content, import);
      if (updated == null) return null;
      if (updated.contains(anchor)) {
        return updated.replaceFirst(anchor, '${call.trimLeft()}\n  $anchor');
      }
      // Fallback for pre-anchor apps where the registrar was an empty stub:
      const emptyStub = 'void registerGeneratedFeatureDependencies(GetIt locator) {}';
      if (updated.contains(emptyStub)) {
        return updated.replaceFirst(
          emptyStub,
          'void registerGeneratedFeatureDependencies(GetIt locator) {\n$call\n}',
        );
      }
      // Fallback: insert before the function's closing brace (last `}`).
      final index = updated.lastIndexOf('}');
      if (index == -1) return null;
      return '${updated.substring(0, index)}$call\n${updated.substring(index)}';
    },
  );
}

// --- shared helpers ----------------------------------------------------------

/// Reads [path], applies [apply], writes the result. Returns true when the
/// file ends up wired (including the already-wired case).
bool _patchFile({
  required Logger logger,
  required String path,
  required String skipIfContains,
  required String? Function(String content) apply,
}) {
  final file = File(path);
  if (!file.existsSync()) {
    logger.warn('$path not found — is the output directory the app root?');
    return false;
  }
  final content = file.readAsStringSync();
  if (content.contains(skipIfContains)) {
    logger.detail('$path already wired — skipped.');
    return true;
  }
  final updated = apply(content);
  if (updated == null) {
    logger.warn('$path: no anchor or fallback insertion point found.');
    return false;
  }
  file.writeAsStringSync(updated);
  logger.info('Updated $path');
  return true;
}

/// Adds [import] after the last existing import (no-op when already present).
String? _withImport(String content, String import) {
  if (content.contains(import)) return content;
  final lines = content.split('\n');
  var lastImport = -1;
  for (var i = 0; i < lines.length; i++) {
    if (lines[i].startsWith('import ')) lastImport = i;
  }
  if (lastImport == -1) return null;
  lines.insert(lastImport + 1, import);
  return lines.join('\n');
}

String _camelCase(String snake) {
  final parts = snake.split(RegExp(r'[_\- ]+')).where((p) => p.isNotEmpty).toList();
  if (parts.isEmpty) return snake;
  return parts.first.toLowerCase() +
      parts.skip(1).map((p) => p[0].toUpperCase() + p.substring(1).toLowerCase()).join();
}

String _pascalCase(String snake) {
  final camel = _camelCase(snake);
  if (camel.isEmpty) return camel;
  return camel[0].toUpperCase() + camel.substring(1);
}
