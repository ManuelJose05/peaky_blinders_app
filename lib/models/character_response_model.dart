// To parse this JSON data, do
//
//     final charactersResponse = charactersResponseFromJson(jsonString);

import 'dart:convert';

import 'package:peaky_blinders_app/models/charactere_model.dart';

CharactersResponse charactersResponseFromJson(String str) => CharactersResponse.fromJson(json.decode(str));

class CharactersResponse {
    List<Character> characters;

    CharactersResponse({
        required this.characters,
    });

    factory CharactersResponse.fromJson(Map<String, dynamic> json) => CharactersResponse(
        characters: List<Character>.from(json["characters"].map((x) => Character.fromJson(x))),

    );

}
