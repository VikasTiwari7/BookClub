import 'package:book_club/login/login.dart';
import 'package:book_club/root/root.dart';
import 'package:book_club/utils/ourThere.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_club/states/currentuserdata.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> CurrentUser(),
      child: MaterialApp(
        theme:ourThere().buildTheme(),
        debugShowCheckedModeBanner: false,
        home:OurRoot(),

      ),
    );

  }
}
