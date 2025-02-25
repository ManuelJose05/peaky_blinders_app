import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:peaky_blinders_app/preferences/user_preferences.dart';
import 'package:peaky_blinders_app/presentation/screens/home_screen.dart';
import 'package:peaky_blinders_app/presentation/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(backgroundColor: Colors.black, body: _SplashView()));
  }
}

class _SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = PreferenciasUsuario();
    final size = MediaQuery.of(context).size;
    Timer(Duration(seconds: 8), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder:
              (contexto, animacion, a) =>
                  prefs.ultimaRuta == 'home' ? HomeScreen() : LoginScreen(),
          transitionsBuilder: (context, animation, secondary, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      );
    });
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/images/fondo.gif', fit: BoxFit.cover),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ZoomIn(
                duration: Duration(seconds: 3),
                child: Image.asset(
                  'assets/images/tommyLogo.png',
                  width: size.width * 0.8,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              FadeIn(
                duration: Duration(seconds: 3),
                child: Text(
                  "By Order of the Peaky Blinders",
                  style: TextStyle(
                    color: Colors.grey[100],
                    overflow: TextOverflow.clip,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
