import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//DB_単語追加クラス

class TangoAddModel extends ChangeNotifier {
  TangoAddModel(this.UserCreatefd,this.Usercreateid);
  String UserCreatefd = '';
  dynamic Usercreateid;
  String tangoname = '';
  String iminame = '';


  TgAdd() async {
    await FirebaseFirestore.instance
        .collection('word')
        .doc(Usercreateid)
        .collection('subcorection')
        .add({
               'memorys' : tangoname,
               'answer'  : iminame,
               'count'   : 0,
               't_yes'   : 0,
               't_no'    : 0,
               't_flg'   : 0,
               'foldname' : UserCreatefd,
    });
  }
}
