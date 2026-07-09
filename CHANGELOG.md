# 0.5.0+1

- **Automatic wiring via `hooks/post_gen.dart`** — after generation the hook edits the host app in place:
  - route name constant in `lib/core/navigation/app_route_names.dart`
  - `GoRoute` entry + view import in `lib/core/navigation/router_provider.dart`
  - registrar call + import in `lib/core/di/generated_features_di.dart`
- Insertion uses the `// mbkh_feat:*` anchor comments seeded by `mbkh_app` `0.5.0+1`; for older apps it falls back to structural heuristics and logs a warning if it cannot wire a file
- Hook is idempotent — re-running `mason make` on the same feature skips already-wired lines
- `WIRING_REQUIRED.md` now marks steps 1–2 as automated (manual instructions kept as fallback)

# 0.4.0+1

- Responsive views: generates `presentation/*_view_tablet.dart` and `*_view_desktop.dart` stubs; dispatcher in `*_view.dart` uses `context.isDesktop` / `context.isMyTablet` (matches `mbkh_app` convention)
- Entity demonstrates the `Nullable<T?>` `copyWith` convention with a nullable `description` field parsed via `expectNullableString`
- Phone view documents `unified_fields` usage through the per-app `<Project>FieldDecoration` factory

# 0.3.0+1

- Align with `mbkh_app` brick: per-feature `*_di.dart`, `project_name` var, package imports
- `entity_name` default is snake_case (`sample_item` → `SampleItem` class)
- `WIRING_REQUIRED.md` documents `generated_features_di.dart` wiring
- Controller uses `Future.microtask(controller.init)` pattern

# 0.2.2+2

- Initial MBKH feature module brick
