import 'package:flutter/material.dart';
import 'package:peaky_blinders_app/presentation/screens/home_screen.dart';
import 'package:peaky_blinders_app/presentation/screens/splash_screen.dart';
import 'package:peaky_blinders_app/providers/characters_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());


class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CharactersProvider(),lazy: false)
      ],
      child: MyApp(),
    );
  }

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peaky Blinders App',
      initialRoute: 'home',
      routes: {
        'splash': (_) => SplashScreen(),
        'home':(_) => HomeScreen()
      },
      theme: ThemeData.light()
      .copyWith(appBarTheme: AppBarTheme(color: Colors.black,titleTextStyle: TextStyle(color: Colors.white,fontSize: 20),iconTheme: IconThemeData(color: Colors.white))),
    );
  }
}