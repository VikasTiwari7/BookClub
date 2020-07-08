import 'package:cloud_firestore/cloud_firestore.dart';


class OurGroup{
  String id;
  String name;
  String leader;
  List<String> member;
  Timestamp groupCreated;
  OurGroup({this.id,this.name,this.leader,this.member,this.groupCreated});
}