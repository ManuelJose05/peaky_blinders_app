import 'package:flutter/material.dart';
import 'package:peaky_blinders_app/models/charactere_model.dart';
import 'package:peaky_blinders_app/provider/character_provider.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Buscar un personjae';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '', 
        icon: Icon(Icons.clear)
        )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null), 
      icon: Icon(Icons.arrow_back)
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final characterProvider = Provider.of<CharacterProvider>(context);
    if (query.isEmpty) {
      return Container(
        child: Center(
          child: Icon(Icons.movie_creation_outlined,color: Colors.black38,size: 150,),
        ),
      );
    }
    return FutureBuilder(
      future: characterProvider.findCharacter(query), 
      builder: (context, snapshot) {
        return !snapshot.hasData ?
        Center(
          child: CircularProgressIndicator())
          :
          ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_,index) {
              return _SuggestionItem(character: snapshot.data![index]);
            }
            );
      },
      );
  }

}

class _SuggestionItem extends StatelessWidget {
  final Character character;

  const _SuggestionItem({ required this.character});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage(
        placeholder: AssetImage('assets/images/no-image.jpg'), 
        image: character.imageUrl == null ? AssetImage('assets/images/loading.gif') : NetworkImage(character.imageUrl!),
        width: 50,
        fit: BoxFit.contain,
        ),
      title: Text(character.name),
      subtitle: Text(character.actor),
      onTap: () => Navigator.pushNamed(context, 'characterDetail',arguments: character),  
    );
  }
}