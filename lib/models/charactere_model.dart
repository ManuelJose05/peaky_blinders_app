
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
}