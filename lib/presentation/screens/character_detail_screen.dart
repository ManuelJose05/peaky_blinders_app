import 'package:flutter/material.dart';
import 'package:peaky_blinders_app/models/charactere_model.dart';
import 'package:peaky_blinders_app/presentation/widgets/horizontal_character_card.dart';
import 'package:peaky_blinders_app/provider/character_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class CharacterDetailScreens extends StatelessWidget {
  const CharacterDetailScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final Character? character =
        ModalRoute.of(context)!.settings.arguments as Character?;
    return character == null ?
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/coin.gif')
        ],
      ),
    )
    :
     Scaffold(appBar: AppBar(title: Text('Character Info'), centerTitle: true,
      leading: IconButton(onPressed: () => Navigator.pushNamed(context,'characters'), icon: Icon(Icons.arrow_back)),
      actions: [
        IconButton(onPressed: () async{
          await Share.shareXFiles([await character.toXFile()],text: 'Aquí te dejo a este personaje para que le eches un vistazo máquina',subject: 'Personaje ${character.name}');
        }, icon: Icon(Icons.share))
      ],
      ),
      body: _CharacterInfoView(character: character,),
    );
  }
}

class _CharacterInfoView extends StatelessWidget {
  final Character character;

  _CharacterInfoView({ required this.character});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
            HorizontalCharactersCard( id: character.id)
          ],
        ),
      ),
    );
  }
}

