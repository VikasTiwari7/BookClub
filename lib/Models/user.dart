import 'package:cloud_firestore/cloud_firestore.dart';

class OurUser{
  String uid;
  String email;
  String fullname;
  Timestamp accountCreated;
  String groupid;


  OurUser({this.uid,this.email,this.fullname,this.accountCreated,this.groupid});



}