import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  

  Future<void> _authenticate(
      String email, String password, String urlPart) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlPart?key=AIzaSyBKjVUdOuyK9igscb9EV9RjDOMtkTWJ5hU';
    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    print(json.decode(response.body));
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
