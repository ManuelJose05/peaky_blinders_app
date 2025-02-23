import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:peaky_blinders_app/models/episode_model.dart';
import 'package:peaky_blinders_app/models/episodes_response_model.dart';
import 'package:peaky_blinders_app/preferences/user_preferences.dart';

class EpisodesProvider with ChangeNotifier{
  final prefs = PreferenciasUsuario();
  final String _url = 'http://10.0.2.2:8080';
  bool expansionChange = false;
  List<Episode> episodes = [];
  List<Episode> aux = [];
  int season = 1;

  EpisodesProvider() {
    getEpisodes();
  }

  Future getEpisodes() async {
    final String token = prefs.userToken;
    Uri uri = Uri.parse('$_url/api/episodes/listPagination?token=$token&size=36');
    Response response = await get(uri);
    final data = episodesResponseFromJson(response.body);
    episodes = data.episodes;
    notifyListeners();
  }

  void getEpisodesBySeason(int idSeason) {
    aux = [];
    for (Episode x in episodes) {
      if (x.seasonNumber == idSeason) aux.add(x);
    }
    notifyListeners();
  }

  void changeExpansion(bool value) {
    expansionChange = value;
    notifyListeners();
  }

  void changeSeason(int id) {
    season = id;
    notifyListeners();
  }
}