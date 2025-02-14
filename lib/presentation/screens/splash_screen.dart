import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _SplashView(),
    );
  }
}

class _SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZoomIn(
              duration: Duration(seconds: 2),
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
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(height: 20,),
            FadeIn(
              duration: Duration(seconds: 3),
              child: SizedBox(
                width: size.width * 0.5,
                child: LinearProgressIndicator(
                  color: Colors.grey[900],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}