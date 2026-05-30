import '../../../../core/helpers/json_validators.dart';

class {{#pascalCase}}{{entity_name}}{{/pascalCase}} {
  final String id;
  final String name;

  {{#pascalCase}}{{entity_name}}{{/pascalCase}}({required this.id, required this.name});

  {{#pascalCase}}{{entity_name}}{{/pascalCase}} copyWith({
    String? id,
    String? name,
  }) => {{#pascalCase}}{{entity_name}}{{/pascalCase}}(
    id: id ?? this.id,
    name: name ?? this.name,
  );

  factory {{#pascalCase}}{{entity_name}}{{/pascalCase}}.empty() => {{#pascalCase}}{{entity_name}}{{/pascalCase}}(id: '', name: '');

  factory {{#pascalCase}}{{entity_name}}{{/pascalCase}}.fromJson(Map<String, dynamic> json) => {{#pascalCase}}{{entity_name}}{{/pascalCase}}(
    id: expectString(json, 'Id'),
    name: expectString(json, 'Name'),
  );

  Map<String, dynamic> toJson() => {'Id': id, 'Name': name};

  @override
  String toString() => name;
}
