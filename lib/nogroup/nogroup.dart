import 'package:book_club/joingroup/creategroup.dart';
import 'package:book_club/joingroup/joingroup.dart';
import 'package:flutter/material.dart';
class OurNoGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _gotojoin(BuildContext context){
      Navigator.push(context,MaterialPageRoute(builder: (context)=>OurJoinGroup()));
    }
    void _gotocreate(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>OurcreateGroup()));
    }
    
    return Scaffold(
      body: Column(
        children: <Widget>[
          Spacer(flex: 1,),
          Padding(padding: EdgeInsets.all(80.0),
            child:Image.asset("assets/logo.png")
            ,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:40.0),
            child: Text(
              "Welcome to Book Club",textAlign: TextAlign.center,style:TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ) ,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(

              "Since you are in a book you can select either "+"to join a club or create a club",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0,
                color: Colors.grey,

            ),
            ),
          ),

          Spacer(flex: 6,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),side: BorderSide(color: Theme.of(context)
                      .secondaryHeaderColor,width: 2)),
                  color:Theme.of(context).canvasColor,
                  child: Text("Create"),


                  onPressed: ()=>_gotocreate(context),
                ),
                RaisedButton(
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),

                  child: Text("Join",style: TextStyle(
                    color: Colors.white,
                  ),),
                  onPressed: ()=>_gotojoin(context),
                  color: Theme.of(context).canvasColor,
                  
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
