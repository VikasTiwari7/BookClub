import 'package:book_club/root/root.dart';
import 'package:book_club/services/database.dart';
import 'package:book_club/states/currentuserdata.dart';
import 'package:book_club/widgets/ourcontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class OurcreateGroup extends StatefulWidget {
  @override
  _OurcreateGroupState createState() => _OurcreateGroupState();
}
class _OurcreateGroupState extends State<OurcreateGroup> {

  TextEditingController _creategroup=TextEditingController();

  void _creategroup1(BuildContext context,String groupname)async{
    CurrentUser _currentuser=Provider.of<CurrentUser>(context,listen: false);
    String _returnString=await OurDatabase().createGroup(groupname,_currentuser.getCurrentUser.uid);
    if(_returnString=="sucess"){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>OurRoot()), (route) => false);
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
          Spacer(flex:10,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child:ShadowContainer(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _creategroup,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.group),
                    hintText: "Group Name"
                  ),
                ),
                SizedBox(),
                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    child: Text("Create",
                    style:TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                    ),
                  ),
                  onPressed: (){
                    _creategroup1(context,_creategroup.text);
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
