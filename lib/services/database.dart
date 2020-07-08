import 'package:book_club/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OurDatabase{
  final Firestore _fire=Firestore.instance;
  Future<String> createuser(OurUser user) async{
    String retavl="error";
    try{
      await _fire.collection("users").document(user.uid).setData({
       'fullname':user.fullname,
       'email':user.email,
        'accountCreated':Timestamp.now(),
      });
      retavl="sucess";
    }
    catch(e)
    {
     print(e);
    }
    return retavl;
  }
  Future<OurUser> getUserInfo(String uid) async{
    OurUser retVal=OurUser();
    try
    {
      DocumentSnapshot _docshot=await _fire.collection("users").document(uid).get();
      retVal.uid=uid;
      retVal.fullname=_docshot.data["fullname"];
      retVal.email=_docshot.data["email"];
      retVal.accountCreated=_docshot.data["accountCreated"];
      retVal.groupid=_docshot.data['groupid'];
    }
    catch(e)
    {
      print(e.message);
    }
    return retVal;

  }
  Future<String> createGroup(String groupname,String userUid) async{
    String retavl="error";
    List<String> member=List();
    try{
      member.add(userUid);
      DocumentReference _docRefrence=await _fire.collection("group").add({
        'name':groupname,
        'leadet':userUid,
        'member':member,
        'groupCreated':Timestamp.now()

      });
      await _fire.collection("users").document(userUid).updateData({
      'groupid':_docRefrence.documentID});
      retavl="sucess";
      }
    catch(e)
    {
      print(e);
    }
    return retavl;
  }
  Future<String> JoinGroup(String groupId,String userUid) async{
    String retavl="error";
    List<String> member=List();
    try{
      member.add(userUid);
      await _fire.collection("groups").document(groupId).updateData({
        'member':FieldValue.arrayUnion(member),
      });
      await _fire.collection("users").document(userUid).updateData({
        'groupid':groupId});
      retavl="sucess";
    }
    catch(e)
    {
      print(e);
    }
    return retavl;
  }
}