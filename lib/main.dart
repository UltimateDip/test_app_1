import 'package:flutter/material.dart';
import 'package:test_app_1/auth_screen.dart';
import 'package:test_app_1/foodmenu_page.dart';
import 'package:test_app_1/welcome_screen.dart';
import 'registration_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:  ThemeData.dark(),
            initialRoute: WelcomeScreen.id,
            routes: {WelcomeScreen.id : (context)=> WelcomeScreen(),
              RegistrationScreen.id : (context)=> RegistrationScreen(),
              AuthScreen.routeName : (context)=> AuthScreen(),
              FoodMenuPage.id : (context)=> FoodMenuPage()
            },
          );
  }
}


