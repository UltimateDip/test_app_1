import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_1/auth.dart';
import 'package:test_app_1/foodmenu_page.dart';

enum AuthMode { SignUp, Login }

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size; //inspect

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
                height: 180,
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
                                'images/map.png',
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
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 60, left: deviceSize.width * .8),
                      height: 120,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage(
                            'images/bubble.png',
                          ),
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
            AuthCard(),
          ],
        ),
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      //invalid
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if (_authMode == AuthMode.Login) {
        //log user in
        await Provider.of<Auth>(context, listen: false).login(
          _authData['email'],
          _authData['password'],
        );
      } else {
        //sign up user
        await Provider.of<Auth>(context, listen: false).signUp(
          _authData['email'],
          _authData['password'],
        );
      }
      Navigator.of(context).pushReplacementNamed(FoodMenuPage.id);
    } catch (error) {
      throw (error);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.SignUp;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
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
                        _authData['email'] = value;
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
                      controller: _passwordController,
                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty || value.length < 5) {
                          return 'Password is too short';
                        }
                      },
                      onSaved: (value) {
                        _authData['password'] = value;
                      },
                    ),
                  ),
                  if (_authMode == AuthMode.SignUp)
                    TextFormField(
                      enabled: _authMode == AuthMode.SignUp,
                      decoration:
                      InputDecoration(labelText: 'Confirm Password'),
                      obscureText: true,
                      validator: _authMode == AuthMode.SignUp
                      // ignore: missing_return
                          ? (value) {
                        if (value != _passwordController.text) {
                          return 'Password do not match';
                        }
                      }
                          : null,
                    ),
                ],
              ),
              Column(
                children: <Widget>[
                  if (_isLoading) CircularProgressIndicator(),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  //login button
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 10, top: 10, right: 10),
                    child: Material(
                      elevation: 5.0,
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(10.0),
                      child: MaterialButton(
                        onPressed: _submit,
                        minWidth: 200.0,
                        height: 42.0,
                        child: Text(_authMode == AuthMode.Login
                            ? 'LOGIN '
                            : 'SIGN UP '),
                      ),
                    ),
                  ),
                  //sign up <-> login exchange button
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 10, top: 20, right: 10),
                    child: Material(
                      elevation: 5.0,
                      color: Color(0xff09e0d9),
                      borderRadius: BorderRadius.circular(10.0),
                      child: MaterialButton(
                        onPressed: _switchAuthMode,
                        minWidth: 200.0,
                        height: 42.0,
                        child: Text(
                          '${_authMode == AuthMode.Login
                              ? 'SIGN UP '
                              : 'LOGIN '}INSTEAD',
                        ),
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
