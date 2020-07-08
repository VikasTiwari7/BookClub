import 'package:book_club/home/hom.dart';
import 'package:book_club/login/login.dart';
import 'package:book_club/nogroup/nogroup.dart';
import 'package:book_club/splash/splashscreen.dart';
import 'package:book_club/states/currentuserdata.dart';
//import 'package:book_club/states/currentuserdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
enum AuthStatus {
  unknown,
  notLoggedIn,
  notInGroup,
  inGroup,
  loggedIn,
}

class OurRoot extends StatefulWidget {

  @override
  _OurRootState createState() => _OurRootState();
}
class _OurRootState extends State<OurRoot> {
//  String _authStatus;
  AuthStatus _authStatus=AuthStatus.unknown;
  @override
  void didChangeDependencies() async{
    super.didChangeDependencies();
    CurrentUser _currentuser=Provider.of<CurrentUser>(context,listen: false);
    String _rstring=await _currentuser.onStartup();
    if(_rstring=="sucess"){
      if(_currentuser.getCurrentUser.groupid!=null){

        setState(() {
          _authStatus = AuthStatus.inGroup;
        });
      }else {
        setState(() {
          _authStatus = AuthStatus.notInGroup;
        });
      }
    }else{
      setState(() {
        _authStatus = AuthStatus.notLoggedIn;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget retval;
    switch(_authStatus){
      case AuthStatus.unknown:
        retval=OurSplashScreen();
        break;
      case AuthStatus.notLoggedIn:
        retval=Ourlogin();
        break;
      case AuthStatus.notInGroup:
        retval=OurNoGroup();
        break;
      case AuthStatus.inGroup:
        retval =HomeScren();
        break;
      default:
    }
    return retval;
  }
}
