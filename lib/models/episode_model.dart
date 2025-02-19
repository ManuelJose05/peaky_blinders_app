class Episode {
    int id;
    int seasonNumber;
    int episodeNumber;
    String title;
    String description;

    Episode({
        required this.id,
        required this.seasonNumber,
        required this.episodeNumber,
        required this.title,
        required this.description,
    });

    factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        id: json["id"],
        seasonNumber: json["seasonNumber"],
        episodeNumber: json["episodeNumber"],
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "seasonNumber": seasonNumber,
        "episodeNumber": episodeNumber,
        "title": title,
        "description": description,
    };
}