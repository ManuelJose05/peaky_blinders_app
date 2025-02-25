import 'package:flutter/material.dart';
import 'package:peaky_blinders_app/provider/character_provider.dart';
import 'package:provider/provider.dart';

class QuoteWidget extends StatelessWidget {
  final int index;
  const QuoteWidget({
    super.key, required this.index
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CharacterProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 10,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Text(
        overflow: TextOverflow.clip,
        provider.getCurrentQuote(index),
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}