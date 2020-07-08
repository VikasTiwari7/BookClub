import 'package:flutter/material.dart';

class ourThere{
  Color _lightGreen=Color.fromARGB(255, 213, 235, 220);
  Color _lightgrey=Color.fromARGB(255,164,164,164);
  Color _darkgrey=Color.fromARGB(255, 119, 124, 135);
  ThemeData buildTheme(){
    return ThemeData(
      canvasColor: _lightGreen,
      primaryColor: _lightGreen,
      accentColor: _lightgrey,
      secondaryHeaderColor: _darkgrey,
      hintColor: _lightgrey,
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)
              ,borderSide: BorderSide(color: _lightgrey
          )
          )
      ),
//      buttonBarTheme: ButtonBarThemeData(
////        buttColor:_darkgrey,
//      shape:RoundedRectangleBorder(
//
//      )
      );

  }
}