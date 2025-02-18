import 'package:flutter/material.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Character List'),
        centerTitle: true,
      ),
      body: _CharacterView(),
    );
  }
}

class _CharacterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}