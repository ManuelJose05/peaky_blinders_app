import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _RegisterView(),
    );
  }
}

class _RegisterView extends StatefulWidget {
  @override
  State<_RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<_RegisterView> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87, 
      body: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.65,
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
                    Center(
                      child: Image.network(
                        'https://d2bzx2vuetkzse.cloudfront.net/unshoppable_producs/cfbae664-4cde-457b-8c26-c2ec1764f24d.png',
                        height: 100,
                        width: double.infinity,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Username:',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Roboto', 
                        color: Colors.white,
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'tommy05',
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
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Email:',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Roboto', // Fuente tipo serif para un look clásico
                        color: Colors.white,
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'example@gmail.com',
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
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Password:',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        color: Colors.white,
                      ),
                    ),
                    TextFormField(
                      obscureText: showPassword,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        suffixIconColor: Colors.white,
                        suffixIcon: IconButton(
                          onPressed: () {
                            showPassword = !showPassword;
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
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: FilledButton.icon(
                        onPressed: () {},
                        label: Text(
                          'Create account',
                          style: TextStyle(fontSize: 18),
                        ),
                        icon: Icon(Icons.account_box_outlined),
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
                      "Already register?",
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 16,
                        fontFamily: 'Roboto', // Fuente serif
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          color: Colors.orangeAccent, // Color que resalta
                          fontSize: 16,
                          fontWeight: FontWeight.bold, // Peso en negrita para destacar
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}