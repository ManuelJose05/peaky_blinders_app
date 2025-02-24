import 'package:flutter/material.dart';
import 'package:peaky_blinders_app/models/user_model.dart';
import 'package:peaky_blinders_app/preferences/user_preferences.dart';
import 'package:peaky_blinders_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  bool showPassword = true;
  String errorText = '';
  String email = '';
  String pass = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black87, 
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset('assets/images/login.webp',fit: BoxFit.cover,)),
          Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[700]!,
                        blurRadius: 8,
                        offset: Offset(0, 4), 
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email:',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          color: Colors.white,
                        ),
                      ),
                      CustomTextField(hintText: 'email@example.com',onChangeValue: (value) => {
                        email = value,
                        print(email)
                      },),
                      SizedBox(height: 10,),
                      Text(
                        'Password:',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          color: Colors.white,
                        ),
                      ),
                      CustomPasswordField(showPassword: showPassword, onChangeValue: (value) => {
                        pass = value
                      },),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: FilledButton.icon(
                          onPressed: () async {
                            final prefs = PreferenciasUsuario();
                            User temp = await provider.login(email, pass);
                            if (temp.email.isNotEmpty) {
                              prefs.setUserEmail(temp.email);
                              prefs.setUserToken(temp.token);
                               Navigator.pushReplacementNamed(context, 'home');
                            }
                          },
                          label: Text(
                            'Log In',
                            style: TextStyle(fontSize: 18),
                          ),
                          icon: Icon(Icons.login_outlined),
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(Colors.grey[800]!),
                            foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                            padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
                            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 16,
                          fontFamily: 'Roboto', // Fuente serif
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pushReplacementNamed(context, 'register'),
                        child: Text(
                          'Create an account',
                          style: TextStyle(
                            color: Colors.orangeAccent, 
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
  ]),
      );
  }
}

class CustomPasswordField extends StatefulWidget {
   CustomPasswordField({
    super.key,
    required this.showPassword,
    required this.onChangeValue
  });
  final Function onChangeValue;
  bool showPassword;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => widget.onChangeValue(value),
      obscureText: widget.showPassword,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        suffixIconColor: Colors.white,
        suffixIcon: IconButton(
          onPressed: () {
            widget.showPassword = !widget.showPassword;
            setState(() {
              
            });
          },
          icon: Icon(Icons.remove_red_eye_outlined),
          ),
        hintText: 'ssdsdf12',
        hintStyle: TextStyle(color: Colors.grey[400]),
        labelStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.black,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          gapPadding: 4,
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String hintText;
   CustomTextField({
    super.key, required this.hintText, required this.onChangeValue
  });
  final Function onChangeValue;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => widget.onChangeValue(value),
      validator: (value) {
        if (value == null) return 'Campo Obligatorio';
        if (value.trim().isEmpty) return 'Campo Obligatorio';
        return null;
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder().copyWith(borderSide: BorderSide(color: Colors.red),borderRadius: BorderRadius.circular(20)),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey[400]),
        labelStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.black,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          gapPadding: 4,
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}