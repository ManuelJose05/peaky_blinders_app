import 'package:flutter/material.dart';
import 'package:peaky_blinders_app/models/charactere_model.dart';
import 'package:peaky_blinders_app/provider/character_provider.dart';
import 'package:provider/provider.dart';

class HorizontalCharactersCard extends StatelessWidget {
  const HorizontalCharactersCard({
    super.key,
    required this.id,
  });

  final int id;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CharacterProvider>(context);
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: provider.characters.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap:
                () => Navigator.pushReplacementNamed(
                  context,
                  'characterDetail',
                  arguments: provider.characters[index],
                ),
            child: SizedBox(
              width: 150,
              height: 250,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image(
                      image: NetworkImage(provider.characters[index].imageUrl!),
                      width: 120,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    provider.characters[index].name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
