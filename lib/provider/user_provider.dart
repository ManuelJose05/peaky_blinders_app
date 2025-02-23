import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:peaky_blinders_app/models/user_model.dart';
import 'package:peaky_blinders_app/models/users_response_model.dart';

class UserProvider with ChangeNotifier {
  final String _url = 'http://10.0.2.2:8080';

  Future<User> login(String emailUser, String passwordUser) async {
    Uri uri = Uri.parse('$_url/api/login');
    Response response = await  post(uri,body:jsonEncode( {
      "email": emailUser,
      "password": passwordUser
    }),
    headers: {
      'Content-Type': 'application/json', 
    },
    );
    final UserResponse data = userResponseFromJson(response.body);
    return data.user;
  }

  Future<User> register(String email, String password) async {
    Uri uri = Uri.parse('$_url/api/register');
    Response response = await post(uri,body: jsonEncode({
      "email": email,
      "password": password,
      "rol":"user"
    }),
    headers: {
      'Content-Type': 'application/json', 
    },
    );
    Map<String,dynamic> data = jsonDecode(response.body);
    User temp = User(email: email, password: password, token: data['token'], rol: 'user');
    return temp;
  }
}