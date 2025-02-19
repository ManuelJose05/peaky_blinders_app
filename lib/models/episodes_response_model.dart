// To parse this JSON data, do
//
//     final episodesResponse = episodesResponseFromJson(jsonString);

import 'dart:convert';

import 'package:peaky_blinders_app/models/episode_model.dart';

EpisodesResponse episodesResponseFromJson(String str) => EpisodesResponse.fromJson(json.decode(str));


class EpisodesResponse {
    List<Episode> episodes;

    EpisodesResponse({
        required this.episodes,
    });

    factory EpisodesResponse.fromJson(Map<String, dynamic> json) => EpisodesResponse(
        episodes: List<Episode>.from(json["episodes"].map((x) => Episode.fromJson(x))),
    );

}


