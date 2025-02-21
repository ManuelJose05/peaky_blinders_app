import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hint: Text('example@gmail.com'),
                  label: Text('Email'),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),gapPadding: 4)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}