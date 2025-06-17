import 'dart:convert';
import 'package:floor/floor.dart';

/// Representa uma entidade do sistema que armazena informações sobre um item,
/// criatura ou local do universo de Hyrule.
///
/// A classe `Entry` é utilizada para modelar e persistir dados relevantes, como
/// nome, imagem, descrição, localizações comuns e categoria. Ela serve como base
/// para operações de armazenamento, recuperação e manipulação de dados no sistema,
/// facilitando a integração entre a camada de dados e a lógica de negócio.
@entity
class Entry {
  @primaryKey
  int id;
  String name;
  String image;
  String description;
  String commonLocations;
  String category;

  Entry({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.commonLocations,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'commonLocations': commonLocations,
      'category': category,
    };
  }

  factory Entry.fromMap(Map<String, dynamic> map) {
    return Entry(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
      commonLocations:
          jsonEncode(map['common_locations'] ?? ['Sem localização']),
      category: map['category'] as String,
    );
  }

  List<String> commonLocationsConverter() {
    return (jsonDecode(commonLocations) as List<dynamic>)
        .map((location) => location as String)
        .toList();
  }

  String toJson() => json.encode(toMap());

  factory Entry.fromJson(String source) =>
      Entry.fromMap(json.decode(source) as Map<String, dynamic>);
}
