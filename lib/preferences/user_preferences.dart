
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia = PreferenciasUsuario._internal();

  factory PreferenciasUsuario(){
    return _instancia;
  }
  PreferenciasUsuario._internal();
  SharedPreferences? _prefs;

  iniPrefs() async{
    _prefs = await SharedPreferences.getInstance();
  }

  String get ultimaRuta{
    return _prefs!.getString('ruta') ?? "login";
  }

  void setUltimaRuta(String valor){
    _prefs!.setString('ruta', valor);
  }

  void setUserEmail(String email) {
    _prefs!.setString('email', email);
  }

  void clearUserPreferences() {
    _prefs!.clear();
  }
  

  void setUserToken(String token) {
    _prefs!.setString('token', token);
  }

  String get userToken {
    return _prefs!.getString('token')!;
  }
  
}