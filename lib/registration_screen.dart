import 'package:flutter/material.dart';
import 'package:test_app_1/foodmenu_page.dart';

import 'package:test_app_1/reusable_elements/round_buttons.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email, password;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: Container(
                height: 150,
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25.0),
                      child: Center(
                        child: Container(
                          height: 120,
                          width: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'images/girl_light.png',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'images/bubble.png',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      margin:
                      EdgeInsets.only(top: 60, left: deviceSize.width * .8),
                      height: 130,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        image: DecorationImage(
                          image: AssetImage(
                            'images/bubble.png',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Hero(
              tag: 'FasTo logo',
              child: Container(
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Fas",
                          style: TextStyle(
                            color: Color(0xffffc1fa),
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                        TextSpan(
                          text: "To",
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
              ),
            ),
            Divider(
              thickness: 1,
              indent: 120,
              endIndent: 120,
              color: Color(0xffffe0f7),
            ),
            Card(
              elevation: 0,
              color: Colors.white,
              child: Container(
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 10, top: 10, right: 10),
                        child: TextFormField(
                          style: TextStyle(
                            color: Color(0xff000000),
                          ),
                          decoration: InputDecoration(
                            hintText: 'Username',
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 16.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[400]),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[400]),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 10, top: 10, right: 10),
                        child: TextFormField(
                          style: TextStyle(
                            color: Color(0xff000000),
                          ),
                          decoration: InputDecoration(
                            hintText: 'E-mail',
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 16.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[400]),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[400]),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,

                          // ignore: missing_return
                          validator: (value) {
                            if (value.isEmpty || !value.contains('@')) {
                              return 'Invalid E-Mail';
                            }
                          },
                          onSaved: (value) {
                            email = value;
                          },
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 10, top: 10, right: 10),
                        child: TextFormField(
                          style: TextStyle(
                            color: Color(0xff000000),
                          ),
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 16.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[400]),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[400]),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),

                          obscureText: true,

                          //TODO
                          // controller: TextEditingController(),

                          // ignore: missing_return
                          // validator: (value) {
                          //   if (value.isEmpty || value.length < 5) {
                          //     return 'Password is too short';
                          //   }
                          // },
                          // onSaved: (value) {
                          //   password = value;
                          // },
                        ),
                      ),
                      RoundButton(
                        color: Color(0xff09e0d9),
                        title: 'Sign Up',
                        onClick: () {
                          print(email);
                          print(password);

                          //TODO
                          // await Provider.of<Auth>(context, listen: false)
                          //     .signUp(email, password);

                          Navigator.of(context)
                              .pushReplacementNamed(FoodMenuPage.id);
                          setState(() {
                            CircularProgressIndicator();
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
