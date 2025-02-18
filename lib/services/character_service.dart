import 'package:http/http.dart';
import 'package:peaky_blinders_app/models/character_response_model.dart';
import 'package:peaky_blinders_app/models/charactere_model.dart';

class CharacterService {
  final String _url = 'http://localhost:8080';
  final String token = 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwZWRyb0BnbWFpbC5jb20iLCJpYXQiOjE3Mzc3Mzc2NjB9.sttmGsu4qsaPWnTPBRH2zx1IwZJV6PyvdAWW5w8UwG0';

  Future<List<Character>> getCharacters() async {
    Uri uri = Uri.parse('$_url/api/characters?token=$token');
    Response response = await get(uri);
    final data = charactersResponseFromJson(response.body);
    return data.characters;
  }
}