import 'package:book_club/root/root.dart';
import 'package:book_club/services/database.dart';
import 'package:book_club/states/currentuserdata.dart';
import 'package:book_club/widgets/ourcontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class OurJoinGroup extends StatefulWidget {
  @override
  _OurJoinGroupState createState() => _OurJoinGroupState();
}
class _OurJoinGroupState extends State<OurJoinGroup> {
  TextEditingController _groupid= TextEditingController();

  void _joingroup(BuildContext context,String groupid)async{
    CurrentUser _currentuser=Provider.of<CurrentUser>(context,listen: false);
    String _returnString=await OurDatabase().JoinGroup(groupid,_currentuser.getCurrentUser.uid);
    if(_returnString=="sucess"){
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(
          builder: (context)=>OurRoot()),
              (route) => false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
              ],
            ),
          ),
          Spacer(flex: 10,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child:ShadowContainer(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller:_groupid,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.group),
                        hintText: "Group Id"
                    ),
                  ),
                  SizedBox(),
                  RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      child: Text("Join",
                        style:TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    onPressed: (){
                      _joingroup(context,_groupid.text);
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
