import 'package:flutter/material.dart';
import 'package:peaky_blinders_app/models/episode_model.dart';
import 'package:peaky_blinders_app/provider/episodes_provider.dart';
import 'package:provider/provider.dart';

class EpisodesListScreen extends StatelessWidget {
  const EpisodesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EpisodesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pushNamed(context, 'home'),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Season ${provider.season}',
          style: TextStyle(
            fontFamily: 'Serif',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      body: PageView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        onPageChanged: (value) {
          if (provider.season == 6)
            provider.changeSeason(1);
          else
            provider.changeSeason(provider.season + 1);
        },
        itemBuilder: (context, index) {
          return _EpisodeListView(season: provider.season);
        },
      ),
    );
  }
}

class _EpisodeListView extends StatelessWidget {
  final int season;

  _EpisodeListView({required this.season});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EpisodesProvider>(context);
    provider.getEpisodesBySeason(season);
    return ListView.builder(
      itemCount: provider.aux.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(4, 4),
                blurRadius: 6,
              ),
            ],
          ),
          child: ExpansionTile(
            expansionAnimationStyle: AnimationStyle(
              duration: Duration(milliseconds: 800),
              curve: Curves.fastLinearToSlowEaseIn,
              reverseCurve: Curves.fastEaseInToSlowEaseOut,
              reverseDuration: Duration(milliseconds: 800),
            ),
            backgroundColor: Colors.black,
            collapsedBackgroundColor: Colors.grey[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onExpansionChanged: (value) => provider.changeExpansion(value),
            trailing: Icon(
              !provider.expansionChange
                  ? Icons.arrow_drop_down
                  : Icons.arrow_drop_up,
              color: Colors.white70,
            ),
            title: Text(
              provider.aux[index].title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'OldStandardTT', // Fuente más vintage
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              'Episode: ${provider.aux[index].episodeNumber} - Season: ${provider.aux[index].seasonNumber}',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            leading: Icon(Icons.movie_creation_outlined, color: Colors.white70),
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  provider.aux[index].description,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
