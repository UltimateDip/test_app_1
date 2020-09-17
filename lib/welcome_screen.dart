import 'package:flutter/material.dart';
import 'package:test_app_1/foodmenu_page.dart';
import 'registration_screen.dart';
import 'login_screen.dart';
import 'foodmenu_page.dart';
import 'reusable_elements/round_buttons.dart';

class WelcomeScreen extends StatefulWidget {
  static const id='welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xfffdfdfd),

        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Stack(
                children:[

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'images/signin_image.png',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
              ],
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:"Fas",
                        style: TextStyle(
                          color: Color(0xffffc1fa),
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      TextSpan(
                        text:"To",
                        style: TextStyle(
                          color: Color(0xfff09ae9),
                          fontWeight: FontWeight.bold,
                          fontSize: 33,
                      ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                indent: 140,
                endIndent: 140,
                color: Color(0xffffe0f7),
              ),
              RoundButton(
                  color: Color(0xff09e0d9),
                  title: 'Register',
                  route: RegistrationScreen()),
              RoundButton(
                  color: Colors.lightBlueAccent,
                  title: 'Log In',
                  route: FoodMenuPage()),
            ],
          ),
        ),
      ),
    );
  }
}
