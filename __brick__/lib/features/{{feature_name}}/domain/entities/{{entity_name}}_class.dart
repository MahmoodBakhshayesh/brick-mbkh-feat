import '/core/helpers/json_validators.dart';
import '/core/helpers/nullable.dart';

class {{#pascalCase}}{{entity_name}}{{/pascalCase}} {
  final String id;
  final String name;
  final String? description;

  const {{#pascalCase}}{{entity_name}}{{/pascalCase}}({required this.id, required this.name, this.description});

  /// Nullable fields use the [Nullable] wrapper so `null` can be assigned
  /// explicitly (see cursor rule: flutter-entity-copywith-nullable).
  {{#pascalCase}}{{entity_name}}{{/pascalCase}} copyWith({
    String? id,
    String? name,
    Nullable<String?>? description,
  }) =>
      {{#pascalCase}}{{entity_name}}{{/pascalCase}}(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description != null ? description.value : this.description,
      );

  factory {{#pascalCase}}{{entity_name}}{{/pascalCase}}.empty() => const {{#pascalCase}}{{entity_name}}{{/pascalCase}}(id: '', name: '');

  factory {{#pascalCase}}{{entity_name}}{{/pascalCase}}.fromJson(Map<String, dynamic> json) => {{#pascalCase}}{{entity_name}}{{/pascalCase}}(
        id: expectString(json, 'Id'),
        name: expectString(json, 'Name'),
        description: expectNullableString(json, 'Description'),
      );

  Map<String, dynamic> toJson() => {'Id': id, 'Name': name, 'Description': description};

  @override
  String toString() => name;
}
