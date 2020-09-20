import 'package:flutter/material.dart';
import 'package:test_app_1/auth.dart';

enum AuthMode { SignUp, Login }

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size; //inspect

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: deviceSize.height,
            width: deviceSize.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
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
                AuthCard()
              ],
            ),
          )
        ],
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
    if (_authMode == AuthMode.Login) {
      //log user in
      await Auth().login(
        _authData['email'],
        _authData['password'],
      );
    } else {
      //sign up user
      await Auth().signup(
        _authData['email'],
        _authData['password'],
      );
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
      child: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'E-Mail'),
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
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
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
              if (_authMode == AuthMode.SignUp)
                TextFormField(
                  enabled: _authMode == AuthMode.SignUp,
                  decoration: InputDecoration(labelText: 'Confirm Password'),
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
              if (_isLoading)
                CircularProgressIndicator()
              else

                //login button
                RaisedButton(
                  onPressed: _submit,
                  child:
                      Text(_authMode == AuthMode.Login ? 'LOGIN ' : 'SIGN UP '),
                ),

              //signup <-> login exchange button
              RaisedButton(
                onPressed: _switchAuthMode,
                child: Text(
                  '${_authMode == AuthMode.Login ? 'SIGN UP ' : 'LOGIN '}INSTEAD',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
