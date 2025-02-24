import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:peaky_blinders_app/provider/character_provider.dart';
import 'package:peaky_blinders_app/services/character_service.dart';
import 'package:provider/provider.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Character List'), 
        centerTitle: true,
        leading: IconButton(onPressed: () => Navigator.pushNamed(context,'home'), icon: Icon(Icons.arrow_back)),
        ),
      body: _CharacterView(),
    );
  }
}

class _CharacterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CharacterProvider>(context);
    return provider.characters.isEmpty ?
    Center(
      child: CircularProgressIndicator(),
    )
    :
    ZoomIn(
      duration: Duration(seconds: 2),
      animate: true,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: provider.characters.length,
        itemBuilder: (context, index) {
          provider.characters[index].heroId = 'hero-${provider.characters[index].id}';
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'characterDetail',arguments: provider.characters[index]),
            child: Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.black87,
              shadowColor: Colors.black45,
              child: Column(
                children: [
                  Hero(
                    tag: provider.characters[index].heroId!,
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.network(
                        provider.characters[index].imageUrl!,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/images/loading.gif');
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          provider.characters[index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Merriweather', // Estilo clásico
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 8),
                        Text(
                          provider.characters[index].actor,
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16,
                            fontFamily: 'Merriweather',
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
