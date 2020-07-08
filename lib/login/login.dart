import 'dart:ui';
import 'package:flutter/material.dart';
import 'loginform.dart';
class Ourlogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
          child: ListView(
            padding: EdgeInsets.all(20.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(40.0),
            child:Image.asset('assets/logo.png')
              ,),
            SizedBox(
              height: 20.0,
            ),
             loginform(),
          ],
          ),
            
          ),)
        ],
      ),
    );
  }
}
