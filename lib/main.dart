import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app_1/auth.dart';
import 'package:test_app_1/auth_screen.dart';
import 'package:test_app_1/foodmenu_page.dart';
import 'package:test_app_1/welcome_screen.dart';
import 'registration_screen.dart';
import 'package:provider/provider.dart';

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
    //Problem : How to fix device orientation?
    //solution <start>
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    //solution </end>

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
              initialRoute: auth.isAuth ? FoodMenuPage.id : WelcomeScreen.id,
              routes: {
                WelcomeScreen.id: (context) => WelcomeScreen(),
                RegistrationScreen.id: (context) => RegistrationScreen(),
                AuthScreen.routeName: (context) => AuthScreen(),
                FoodMenuPage.id: (context) => FoodMenuPage()
              },
            ),
      ),
    );
  }
}
