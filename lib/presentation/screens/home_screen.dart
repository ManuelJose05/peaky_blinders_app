import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peaky_blinders_app/presentation/widgets/card_swiper_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peaky Blinders App'),
        centerTitle: true,
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CardSwiperWidget()
        ],
      ),
    );
  }
}