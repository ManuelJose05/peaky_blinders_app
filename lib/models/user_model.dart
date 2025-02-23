
class User {
    String email;
    String password;
    String token;
    String rol;

    User({
        required this.email,
        required this.password,
        required this.token,
        required this.rol,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        password: json["password"],
        token: json["token"],
        rol: json["rol"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "token": token,
        "rol": rol,
    };
}