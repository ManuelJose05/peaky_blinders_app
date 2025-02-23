// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

import 'package:peaky_blinders_app/models/user_model.dart';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

class UserResponse {
    User user;

    UserResponse({
        required this.user,
    });

    factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        user: User.fromJson(json["user"]),
    );
}
