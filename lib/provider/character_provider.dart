import 'package:flutter/material.dart';

class CharacterProvider with ChangeNotifier {
  int indexQuotes = 0;

  final List<String> quotes = [
    "By order of the Peaky Blinders",
    "I'm not a man of many words, but I am a man of action.",
    "You can change what you do, but you can't change what you want.",
    "Everyone's a gangster until the law comes calling.",
    "In the end, we will remember not the words of our enemies, but the silence of our friends."
  ];


  void saveIndexQuotes(int index) {
    indexQuotes = index;
    notifyListeners();
  }

  String getCurrentQuote(){
    return quotes[indexQuotes];
  }
}