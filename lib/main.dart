import 'package:flutter/material.dart';
import 'package:test_app_1/welcome_screen.dart';
import 'registration_screen.dart';
import 'login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(
              color: Colors.white,
          ),
        ),
      ),
     initialRoute: WelcomeScreen.id,
      routes: {WelcomeScreen.id : (context)=> WelcomeScreen(),
        RegistrationScreen.id : (context)=> RegistrationScreen(),
        LoginScreen.id : (context)=> LoginScreen()
      },
    );
  }
}
