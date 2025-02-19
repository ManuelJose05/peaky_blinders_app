import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:peaky_blinders_app/models/episode_model.dart';
import 'package:peaky_blinders_app/models/episodes_response_model.dart';

class EpisodesProvider with ChangeNotifier{
  final String _url = 'http://10.0.2.2:8080';
  final String token = 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwZWRyb0BnbWFpbC5jb20iLCJpYXQiOjE3Mzc3Mzc2NjB9.sttmGsu4qsaPWnTPBRH2zx1IwZJV6PyvdAWW5w8UwG0';
  bool expansionChange = false;

  Future<List<Episode>> getEpisodeBySeason(int season) async {
    Uri uri = Uri.parse('$_url/api/episodes/listPagination?token=$token&page=${season - 1}');
    Response response = await get(uri);
    final data = episodesResponseFromJson(response.body);
    return data.episodes;
  }

  void changeExpansion(bool value) {
    expansionChange = value;
    notifyListeners();
  }
}