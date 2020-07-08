import 'dart:ui';
import 'package:book_club/login/loginform.dart';
import 'package:book_club/signup/signupform.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      BackButton(),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  signupform(),
                ],
              ),
            ),)
        ],
      ),
    );
  }
}
