import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:peaky_blinders_app/models/episode_model.dart';
import 'package:peaky_blinders_app/models/episodes_response_model.dart';
import 'package:peaky_blinders_app/preferences/user_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class EpisodesProvider with ChangeNotifier {
  final prefs = PreferenciasUsuario();
  final String _url = 'http://172.20.10.5:8080';
  bool expansionChange = false;
  List<Episode> episodes = [];
  List<Episode> aux = [];
  int season = 1;

  Map<int, String> peakyBlindersTrailers = {
    1: "https://www.youtube.com/watch?v=oVzVdvGIC7U",
    2: "https://www.youtube.com/watch?v=uIJ07Wg5i0k",
    3: "https://www.youtube.com/watch?v=t5D4-nTAWLY",
    4: "https://www.youtube.com/watch?v=whgdkjDJAjg",
    5: "https://www.youtube.com/watch?v=Ruyl8_PT_y8",
    6: "https://www.youtube.com/watch?v=PxZ5gGfPtCQ",
  };

  EpisodesProvider() {
    getEpisodes();
  }

  void sendTrailer(int idSeason) async {
    Uri uri = Uri.parse(peakyBlindersTrailers[idSeason]!);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      print("No se pudo abrir el enlace");
    }
  }

  Future getEpisodes() async {
    final String token = prefs.userToken;
    Uri uri = Uri.parse(
      '$_url/api/episodes/listPagination?token=$token&size=36',
    );
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
