//import 'dart:html';

import 'package:book_club/signup/signup.dart';
import 'package:book_club/widgets/ourcontainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_club/states/currentuserdata.dart';
class signupform extends StatefulWidget {

  @override
  _signupformState createState() => _signupformState();
}

class _signupformState extends State<signupform> {
  TextEditingController _fullname=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _password=TextEditingController();
  TextEditingController _confimpassword=TextEditingController();
  void _signupuser(String email, String password, BuildContext context,String fullname) async{

    CurrentUser  _currentuser = Provider.of<CurrentUser>(context,listen:false);

    try{
      String _rString =await _currentuser.sugnupUser(email, password, fullname);
      if(_rString=="sucess"){
        Navigator.pop(context);
      }else{
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text("Signup issues"),
              duration: Duration(seconds: 2),),);
      }
//      String  _rstring=await _currentuser._signupuser(email, password);
//      if(_rstring=="Sucess")    {
//        Navigator.pop(context);
//      }else{
//        Scaffold.of(context).showSnackBar(
//            SnackBar(content: Text("Signup issues"),
//              duration: Duration(seconds: 2),)
//        );
//      }
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return  ShadowContainer(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 8.0,
          ),
            child: Text("Sign Up",style: TextStyle(
                color:Theme.of(context).secondaryHeaderColor,fontSize: 25.0,fontWeight: FontWeight.bold
            ),
            ),
          ),
          TextFormField(
            controller: _fullname,
            decoration:InputDecoration
              (prefixIcon: Icon(Icons.person)
                ,hintText: "Full Name"),
          ),
          SizedBox(
            height:20.0 ,),
          TextFormField(
            controller: _email,
            decoration:InputDecoration
              (prefixIcon: Icon(Icons.alternate_email)
                ,hintText: "Email"),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: _password,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              hintText: " Password",
            ),
            obscureText: true,

          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: _confimpassword,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              hintText: "Confirm Password",
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            child:Padding(
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: Text(
                  "Signup"
              ),
            ),
            onPressed: (){
              if(_password.text == _confimpassword.text){
                _signupuser(_email.text,_password.text,context,_fullname.text);
              }else{
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("Password DO not match"),
                  duration: Duration(seconds: 2),)
                );
              }
            },
          ),

        ],
      ),
    );
  }


}
