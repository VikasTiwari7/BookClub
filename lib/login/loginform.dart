import 'package:book_club/home/hom.dart';
import 'package:book_club/root/root.dart';
import 'package:book_club/signup/signup.dart';
import 'package:book_club/states/currentuserdata.dart';
import 'package:book_club/widgets/ourcontainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum LoginType{
  email,
  google,
}



class loginform extends StatefulWidget {
  @override
  _loginformState createState() => _loginformState();
}

class _loginformState extends State<loginform> {
  TextEditingController _email=TextEditingController();
  TextEditingController _password= TextEditingController();

  void _loginUser({@required LoginType type,
    String email, String password,BuildContext context})  async{
    CurrentUser _cu = Provider.of<CurrentUser>(context,listen:false);
    try{
      String _rString;
      switch(type){
        case LoginType.email:
          _rString=await _cu.loginUserWithEmail(email, password);
        break;
        case LoginType.google:
          _rString =await _cu.loginuserWithGoogle();
          break;
        default:

      }
      if(_rString=="sucess") {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OurRoot()));
      }
      else{
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text("Incoreect Login Info!"),
              duration: Duration(seconds: 2),));
      }
      }

    catch(e)
    {
      print(e);
    }
  }
  Widget _googleButton(){
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: (){
        _loginUser(type:LoginType.google,
            context: context);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      highlightElevation: 0 ,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(image:AssetImage("assets/google.png"),height: 25.0,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Sign in with Google",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight:FontWeight.bold,
              ),
            ),
          )
        ],
      ),
      ),
    );
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
            child: Text("Log In",style: TextStyle(
            color:Theme.of(context).secondaryHeaderColor,fontSize: 25.0,fontWeight: FontWeight.bold
          ),
            ),
          ),
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
              hintText: "Password",
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
                  "Login"
              ),
    ),
            onPressed: (){
             _loginUser(type:LoginType.email,
                 email:_email.text,
                 password:_password.text,
                 context:context);
            },
          ),
          FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: Text("Don't have an account? Sign up here",style: TextStyle(
              fontSize: 12.0,fontWeight: FontWeight.bold,

            ),),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup ()));
            },
          ),
          _googleButton(),
        ],
      ),
    );
  }


}
