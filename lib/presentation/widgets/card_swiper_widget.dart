
import 'dart:math';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peaky_blinders_app/presentation/widgets/quote_widget.dart';

class SwiperWidget extends StatelessWidget {
  const SwiperWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int indexQuotes = 0;
    return Column(
      children: [
        Swiper(
          viewportFraction: 0.8,
          itemWidth: MediaQuery.of(context).size.width * 0.8,
          itemHeight: MediaQuery.of(context).size.width * 0.8,
          layout: SwiperLayout.STACK,
          itemCount: 10,
          itemBuilder: (context, index) {
            indexQuotes = index;
            return ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Image(
                image: AssetImage('assets/images/arthur.png')
              ),
            );
          },
        ),
        QuoteWidget(index: indexQuotes),
      ],
    );
  }
}
