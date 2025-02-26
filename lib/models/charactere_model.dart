import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class Character {
  int id;
  String name;
  String? birthDate;
  String nationality;
  String? imageUrl;
  String actor;
  String description;
  String? heroId;

  Character({
    required this.id,
    required this.name,
    required this.birthDate,
    required this.nationality,
    required this.imageUrl,
    required this.actor,
    required this.description,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
    id: json["id"],
    name: json["name"],
    birthDate: json["birthDate"],
    nationality: json["nationality"],
    imageUrl: json["imageUrl"],
    actor: json["actor"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "birthDate": birthDate,
    "nationality": nationality,
    "imageUrl": imageUrl,
    "actor": actor,
    "description": description,
  };

  @override
  String toString() => """
=== Información de Personaje ====
| Nombre: $name                  |
| Actor: $actor                  |
| Fecha de nacimiento: $birthDate|
| Nacionalidad: $nationality     |
| Descripción: $description      |
| Foto: $imageUrl                |
==================================
""";

  Future<XFile> toXFile() async {
    final jsonString = toString();
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/$name-${id}.txt');

    await file.writeAsString(jsonString);
    return XFile(file.path);
  }
}
