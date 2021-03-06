import 'package:flutter/material.dart';
import 'package:test_app_1/main.dart';


class TextFieldFormat extends StatelessWidget {
  final String hintTextTitle;
  final Icon icon;
  TextFieldFormat({@ required this.hintTextTitle, this.icon});

  @override

  Widget build(BuildContext context) {
    String food;
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      child: TextField(

        style: TextStyle(color: Color(0xff000000),),
        decoration: InputDecoration(
          icon: icon,
          hintText: hintTextTitle,
          hintStyle: TextStyle(color: Colors.grey[400]),
          contentPadding:
          EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.grey[400]),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),


      ),
    );
  }
}
