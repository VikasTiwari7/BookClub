//import 'package:book_club/Models/user.dart';
//import 'package:book_club/services/database.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//
//class currentUser extends ChangeNotifier{
//  OurUser _ourUser;
// OurUser get getcurrentUser =>_ourUser;
// FirebaseAuth _auth=FirebaseAuth.instance;
//  Future<String> onStartUp()async{
//    String retval="error";
//    try{
//      FirebaseUser firebaseUser=await _auth.currentUser();
//      _ourUser.uid=firebaseUser.uid;
//      _ourUser.email=firebaseUser.email;
//      retval="sucess";
//    }
//    catch(e)
//    {
//      print(e);
//    }
//    return retval;
//
//  }
//  Future<String> signout()async{
//    String retval="error";
//    try{
//   await _auth.signOut();
//   _ourUser.uid=null;
//   _ourUser.email=null;
//      retval="sucess";
//    }
//    catch(e){
//      print(e);
//    }
//    return retval;
//
//  }
//
import 'package:book_club/Models/user.dart';
import 'package:book_club/services/database.dart';
import 'package:book_club/signup/signupform.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
////  FirebaseAuth _auth=FirebaseAuth.instance;
//  Future<String> signupuser(String email,String password,String fullname) async {
//    String retval="error";
//
//    AuthResult _authResult =await _auth.createUserWithEmailAndPassword(email: email, password: password);
//    OurUser _user=OurUser(_authResult.user.uid,Timestamp.now(),fullname,_authResult.user.email);
//
//    try{
//       String _rString =await  OurDatabase().createuser(_user);
//        if(_rString=="sucess"){
//          retval="sucess";
//        }
//       retval="Sucess";
//
//
//    }on PlatformException catch(e){
//      retval =e.message;
//    }
//    catch(e){
//      retval=e.message;
//    }
//    return retval;
//
//  }
//  Future<String> loginuserWithEmail(String email,String password)async{
//   String retval="error";
//    try{
//      AuthResult _authresult = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
//      FirebaseUser mUser = _authresult.user;
//      print("$mUser  //");
//      print("$_authresult   ///");
//      print(_authresult.user.uid);
//      print(_authresult.user.email);
//      _ourUser.uid=_authresult.user.uid;
//      _ourUser.email=_authresult.user.email;
//        retval="Sucess";
//
//
//    }catch(e){
//      retval =e.message;
//    }
//    return retval;
//
//
//  }
//  Future<String> loginuserWithGoogle()async{
//    String retval="error";
//    GoogleSignIn _googleSignIn = GoogleSignIn(
//      scopes: <String>[
//        'email',
//        'https://www.googleapis.com/auth/contacts.readonly',
//      ],
//    );
//    try{
//       GoogleSignInAccount googleuser= await _googleSignIn.signIn();
//       GoogleSignInAuthentication googleAuth=await googleuser.authentication;
//       final AuthCredential crendital=GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken:googleAuth.accessToken);
//      AuthResult _authresult=await _auth.signInWithCredential(crendital);
//       _ourUser.uid=_authresult.user.uid;
//       _ourUser.email=_authresult.user.email;
//      retval="Sucess";
//
//
//    }catch(e){
//      retval =e.message;
//    }
//    return retval;
//
//
//  }
//}




import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:book_club/Models/user.dart';

 class CurrentUser extends ChangeNotifier{
   OurUser _currentUser= OurUser();
//   String _uid;
////   String _email;
////   String get getUid=>_uid;
   OurUser get getCurrentUser=>_currentUser;
   FirebaseAuth _auth=FirebaseAuth.instance;
   Future<String> onStartup()async{
     String retVal="error";
     try{
       FirebaseUser fbuser=await _auth.currentUser();
       if(fbuser!=null){
         _currentUser= await OurDatabase().getUserInfo(fbuser.uid);
         if(_currentUser!=null){
           retVal="sucess";
         }
       }


     }catch(e){
       print(e);
     }
     return retVal;

   }
   Future<String> signOut()async{
     String retVal="error";
     try{
       await _auth.signOut();
       _currentUser=OurUser();
       _currentUser=null;
       retVal="sucess";

     }catch(e){
       print(e);
     }
     return retVal;

   }
   Future <String> sugnupUser(String email, String password,String fullname) async{
     String retVal= "error";
     OurUser _user=OurUser();
     try
     {
       AuthResult _authResult=await _auth.createUserWithEmailAndPassword(email: email, password: password);
       _user.uid=_authResult.user.uid;
       _user.email=_authResult.user.email;
       _user.fullname=fullname;
       String _retunStrin=await OurDatabase().createuser(_user);
       if(_retunStrin=="sucess"){
         retVal="sucess";
       }
         retVal="sucess";
     }catch(e){
       retVal=e.message;
     }

     return retVal;

   }
   Future<String>loginUserWithEmail(String email,String password) async{
//     print("vikas login kar2");
     String retVal= "error";
     try
     {
       AuthResult _authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
//       print("vikas login kar");
       _currentUser= await OurDatabase().getUserInfo(_authResult.user.uid);
       if(_currentUser!=null){
         retVal="sucess";
       }


     }catch(e){
//       print("catch chala"+e);
     retVal=e.message;

     }

     return retVal;


   }
   Future<String> loginuserWithGoogle()async{
    String retVal="error";
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: <String>[
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    OurUser _user1=OurUser();
    try{
       GoogleSignInAccount googleuser= await _googleSignIn.signIn();
       GoogleSignInAuthentication googleAuth=await googleuser.authentication;
       final AuthCredential crendital=GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken:googleAuth.accessToken);
      AuthResult _authresult=await _auth.signInWithCredential(crendital);
      if(_authresult.additionalUserInfo.isNewUser){
        _user1.uid=_authresult.user.uid;
        _user1.email=_authresult.user.email;
        _user1.fullname=_authresult.user.displayName;
        OurDatabase().createuser(_user1);

      }
     _currentUser= await OurDatabase().getUserInfo(_authresult.user.uid);
      if(_currentUser!=null){
        retVal="sucess";
      }
//       _currentUser.uid=_authresult.user.uid;
//       _currentUser.email=_authresult.user.email;
//      retval="sucess";


    }catch(e){
      retVal =e.message;
    }
    return retVal;


  }

 }