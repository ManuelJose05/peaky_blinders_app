import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:peaky_blinders_app/presentation/screens/character_detail_screen.dart';
import 'package:peaky_blinders_app/presentation/screens/character_screen.dart';
import 'package:peaky_blinders_app/presentation/screens/episodes_list_screen.dart';
import 'package:peaky_blinders_app/presentation/screens/home_screen.dart';
import 'package:peaky_blinders_app/presentation/screens/login_screen.dart';
import 'package:peaky_blinders_app/presentation/screens/splash_screen.dart';
import 'package:peaky_blinders_app/provider/character_provider.dart';
import 'package:peaky_blinders_app/provider/episodes_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());


class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CharacterProvider(),lazy: false),
        ChangeNotifierProvider(create: (_) => EpisodesProvider(),lazy: false),
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
      supportedLocales: [
        Locale('es', 'ES'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: 'Peaky Blinders App',
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginScreen(),
        'splash': (_) => SplashScreen(),
        'home':(_) => HomeScreen(),
        'characters': (_) => CharacterScreen(),
        'characterDetail': (_) => CharacterDetailScreens(),
        'episodesList': (_) => EpisodesListScreen()
      },
      theme: ThemeData.light()
      .copyWith(appBarTheme: AppBarTheme(color: Colors.black,titleTextStyle: TextStyle(color: Colors.white,fontSize: 20),iconTheme: IconThemeData(color: Colors.white))),
    );
  }
}