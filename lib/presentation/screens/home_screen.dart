
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peaky_blinders_app/preferences/user_preferences.dart';
import 'package:peaky_blinders_app/presentation/widgets/card_swiper_widget.dart';
import 'package:peaky_blinders_app/presentation/widgets/custom_widget.dart';
import 'package:peaky_blinders_app/search/info_search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = PreferenciasUsuario();
    prefs.setUltimaRuta('home');
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          actions: [
          IconButton(onPressed: () => showSearch(
            context: context, 
            delegate: MovieSearchDelegate()
            ), icon: Icon(Icons.search_outlined))
        ],
          title: Text(
            'Peaky Blinders App',
            style: GoogleFonts.playfairDisplay(
              textStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: Colors.white,
                shadows: [
                  Shadow(
                    offset: Offset(1.5, 1.5),
                    blurRadius: 3,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: _HomeView(),
      ),
    );
  }
}



class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/darkStreet.webp'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SwiperWidget(),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}


