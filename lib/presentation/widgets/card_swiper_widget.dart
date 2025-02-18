
import 'dart:math';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peaky_blinders_app/presentation/widgets/quote_widget.dart';
import 'package:peaky_blinders_app/provider/character_provider.dart';
import 'package:provider/provider.dart';

class SwiperWidget extends StatelessWidget {
  const SwiperWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CharacterProvider>(context);
    return Column(
      children: [
        Swiper(
          onIndexChanged: (value) => provider.saveIndexQuotes(value),
          viewportFraction: 0.8,
          itemWidth: MediaQuery.of(context).size.width * 0.8,
          itemHeight: MediaQuery.of(context).size.width * 0.8,
          layout: SwiperLayout.STACK,
          itemCount: provider.quotes.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Image(
                image: AssetImage('assets/images/arthur.png')
              ),
            );
          },
        ),
        QuoteWidget(),
      ],
    );
  }
}
