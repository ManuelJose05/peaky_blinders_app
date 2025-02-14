import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiperWidget extends StatelessWidget {
  const CardSwiperWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Swiper(
      itemCount: 1,
      layout: SwiperLayout.TINDER,
      );
  }
}