import 'package:flutter/material.dart';
import 'package:peaky_blinders_app/models/charactere_model.dart';
import 'package:peaky_blinders_app/provider/character_provider.dart';

class HorizontalCharactersCard extends StatelessWidget {
  const HorizontalCharactersCard({
    super.key,
    required this.provider,
    required this.id,
  });

  final CharacterProvider provider;
  final int id;

  @override
  Widget build(BuildContext context) {
    List<Character> characters = provider.getRestCharacters(id);
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'characterDetail',arguments: characters[index]),
            child: SizedBox(
              width: 150,
              child: Column(
                children: [
                  Hero(
                    tag: characters[index].heroId!,
                    child: Image(image: NetworkImage(characters[index].imageUrl!),width: 100,height: 100,fit: BoxFit.cover,)),
                  Text(characters[index].name, maxLines: 1,overflow: TextOverflow.ellipsis,)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}