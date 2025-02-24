import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:peaky_blinders_app/models/character_response_model.dart';
import 'package:peaky_blinders_app/models/charactere_model.dart';
import 'package:peaky_blinders_app/preferences/user_preferences.dart';

class CharacterProvider with ChangeNotifier {  
  final prefs = PreferenciasUsuario();
  int indexQuotes = 0;
  final String _url = 'http://10.0.2.2:8080';
  
  final List<String> quotes = [
    "By order of the Peaky Blinders",
    "I'm not a man of many words, but I am a man of action.",
    "You can change what you do, but you can't change what you want.",
    "Everyone's a gangster until the law comes calling.",
    "In the end, we will remember not the words of our enemies, but the silence of our friends.",
  ];
  List<Character> characters = [];

  CharacterProvider() {
    getCharacters();
  }

  void saveIndexQuotes(int index) {
    indexQuotes = index;
    notifyListeners();
  }

  String getCurrentQuote() {
    return quotes[indexQuotes];
  }

  Future getCharacters() async {
    String token = prefs.userToken;
    Uri uri = Uri.parse('$_url/api/characters?token=$token');
    Response response = await get(uri);
    final data = charactersResponseFromJson(response.body);
    characters = data.characters;
    notifyListeners();
  }

  Future<List<Character>> findCharacter(String query) async{
    String token = prefs.userToken;
    Uri uri = Uri.parse('$_url/api/characters/find?token=$token&query=$query');
    Response response = await get(uri);
    final data = charactersResponseFromJson(response.body);
    return data.characters;
  }
}
