import 'dart:io';
import 'dart:typed_data';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:peaky_blinders_app/presentation/widgets/quote_widget.dart';
import 'package:peaky_blinders_app/provider/character_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SwiperWidget extends StatelessWidget {
  const SwiperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CharacterProvider>(context);
    List<String> images = [
      'arthur.png',
      'swipper1.png',
      'swipper2.png',
      'swipper3.png',
      'tommySinFondo.png',
    ];

    return SizedBox(
      height: 650,
      width: double.infinity,
      child: Swiper(
        itemCount: images.length,
        autoplay: true,
        autoplayDisableOnInteraction: true,
        autoplayDelay: 10000,
        duration: 1000,
        loop: true,
        onIndexChanged: (value) => provider.saveIndexQuotes(value),
        viewportFraction: 0.9,
        scale: 0.9,
        fade: 0.5,
        itemWidth: double.infinity,
        itemHeight: 400,
        layout: SwiperLayout.DEFAULT,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/images/${images[index]}',
                  width: double.infinity,
                  height: 400,
                  fit: BoxFit.fitHeight,
                ),
              ),
              QuoteWidget(index: index),
              SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}