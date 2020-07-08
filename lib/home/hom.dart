import 'package:book_club/login/login.dart';
import 'package:book_club/nogroup/nogroup.dart';
import 'package:book_club/root/root.dart';
import 'package:book_club/states/currentuserdata.dart';
import 'package:book_club/widgets/ourcontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomeScren extends StatelessWidget {
  void _gotoNoGroup(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>OurNoGroup()));

  }
  void _signout(BuildContext context)async{
    CurrentUser _cu = Provider.of<CurrentUser>(context, listen: false);
  String _rstring =await _cu.signOut();
  if(_rstring=="sucess"){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>OurRoot()), (route) => false);
  }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:ListView(
       children: <Widget>[
         SizedBox(
           height: 40.0,
         ),
         Padding(
           padding: const EdgeInsets.all(20.0),
           child: ShadowContainer(
               child: Column(
                 children: <Widget>[
                   Text("Harry Porter and the Socrerer's story ",
                     style: TextStyle(
                         fontSize: 30.0,color: Colors.grey[660]
                     ),),
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 20.0),
                     child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                         Text("Due In: ",style: TextStyle(
                           fontSize: 30.0, color: Colors.grey
                         ),),
                         Text("8 Days",style: TextStyle(
                           fontSize: 30.0,fontWeight: FontWeight.bold,
                         ),),
                       ],
                     ),
                   ),
                   RaisedButton(
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                     child: Text("Finished Book",style: TextStyle(
                       color: Colors.white,
                     ),),
                   )
                 ],
               )
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(20.0),
           child: ShadowContainer(
               child: Column(
                 children: <Widget>[
                   Text("Next Book Revealed ",
                     style: TextStyle(
                         fontSize: 30.0,color: Colors.grey[660]
                     ),),
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 20.0),
                     child: Column(
//
                     crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Text("Next Book Revealed ",style: TextStyle(
                             fontSize: 30.0, color: Colors.grey
                         ),),
                         Text("24 Hours",style: TextStyle(
                           fontSize: 30.0,fontWeight: FontWeight.bold,
                         ),),
                       ],
                     ),
                   ),
                   RaisedButton(
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                     child: Text("See More Offer ",style: TextStyle(
                       color: Colors.white,
                     ),),
                   )
                 ],
               )

           ),
         ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),
           child: RaisedButton(
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
             child: Text(
               "Book Club History",style: TextStyle(
               color: Colors.white,
             ),
             ),
             onPressed: (){
               _gotoNoGroup(context);

             }
           ),
         ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 40.0),
           child: RaisedButton(
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),side: BorderSide(color: Theme.of(context)
                 .secondaryHeaderColor,width: 2)),
             child: Text(
               "Sign Out",
             ),
             onPressed: ()=>_signout(context),
             color: Theme.of(context).canvasColor,
           ),
         )
       ],
     )
    );
  }
}
