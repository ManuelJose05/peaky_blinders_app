import 'package:flutter/material.dart';
import 'package:peaky_blinders_app/models/charactere_model.dart';
import 'package:peaky_blinders_app/presentation/widgets/horizontal_character_card.dart';
import 'package:peaky_blinders_app/provider/character_provider.dart';
import 'package:provider/provider.dart';

class CharacterDetailScreens extends StatelessWidget {
  const CharacterDetailScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Character Info'), centerTitle: true,
      leading: IconButton(onPressed: () => Navigator.pushNamed(context,'characters'), icon: Icon(Icons.arrow_back)),
      ),
      body: _CharacterInfoView(),
    );
  }
}

class _CharacterInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CharacterProvider>(context);
    final Character character =
        ModalRoute.of(context)!.settings.arguments as Character;
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Hero(
              tag: character.heroId!,
              child: Image.network(character.imageUrl!, fit: BoxFit.cover)),
          ),
          SizedBox(height: 16),
          Text(
            character.name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Text(
            character.description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Nationality: ${character.nationality}',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          SizedBox(height: 4),
          Text(
            'Played by: ${character.actor}',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 15,),
          SizedBox(width: MediaQuery.of(context).size.width * 0.8,child: Divider()),
          Text('Others Characters',
          style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15,),
          HorizontalCharactersCard(provider: provider, id: character.id)
        ],
      ),
    );
  }
}

