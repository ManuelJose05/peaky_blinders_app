import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peaky_blinders_app/preferences/user_preferences.dart';
import 'package:peaky_blinders_app/provider/episodes_provider.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1,
      shadowColor: Colors.black12,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Container(
        color: Color(0xFF2C2F38),
        child: ListView(
          padding: EdgeInsets.only(bottom: 5),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF1A1D21)),
              child: Text(
                'Peaky Blinders App Menu',
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoSlab(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 8),
              child: Column(
                children: [
                  // Opciones de personajes
                  Text(
                    'CHARACTERS',
                    style: GoogleFonts.robotoSlab(
                      fontSize: 18,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, 'characters'),
                    child: Text(
                      'Characters List',
                      style: GoogleFonts.robotoSlab(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(height: 15, color: Colors.grey),

                  // Opciones de temporadas
                  Text(
                    'SEASONS',
                    style: GoogleFonts.robotoSlab(
                      fontSize: 18,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _buildSeasonButton(context, 'Season 1', 1),
                  _buildSeasonButton(context, 'Season 2',2),
                  _buildSeasonButton(context, 'Season 3',3),
                  _buildSeasonButton(context, 'Season 4',4),
                  _buildSeasonButton(context, 'Season 5',5),
                  _buildSeasonButton(context, 'Season 6',6),

                  Divider(height: 2,color: Colors.grey,),
                  SizedBox(height: 5,),

                  Text(
                    'USER',
                    style: GoogleFonts.robotoSlab(
                      fontSize: 18,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      final prefs = PreferenciasUsuario();
                      prefs.clearUserPreferences();
                      Navigator.pushReplacementNamed(context, 'login');
                    },
                    child: Text(
                      'Log Out',
                      style: GoogleFonts.robotoSlab(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  Divider(height: 2,color: Colors.grey,),
                  SizedBox(height: 25,),
                  Text('App diseñada por Manuel José Liébana',
                  style: TextStyle(color: Colors.white,fontSize: 17),
                  textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildSeasonButton(BuildContext context, String season, int id) {
  final provider = Provider.of<EpisodesProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextButton(
        onPressed: () {
          provider.changeSeason(id);
          Navigator.pushReplacementNamed(context, 'episodesList',arguments: id);
        },
        child: Text(
          season,
          style: GoogleFonts.robotoSlab(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }