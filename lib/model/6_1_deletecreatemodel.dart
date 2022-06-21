import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//FD削除クラス

class DeleteModel1 extends ChangeNotifier {

  DeleteCreateModel1(String fooldid, dynamic id) async {

    deleteFd(fooldid, id);
    await FirebaseFirestore.instance
        .collection('word')
        .doc(id)
        .delete();
  }

  deleteFd(String fooldid, dynamic id) async {
    QuerySnapshot snapshot =
    await FirebaseFirestore.instance
        .collection('word')
        .doc(id)
        .collection('subcorection')
        .where('foldname', isEqualTo: fooldid)
        .get();

    snapshot.docs.map((DocumentSnapshot document) {
      final dynamic ids = document.id;
      FirebaseFirestore.instance
          .collection('word')
          .doc(id)
          .collection('subcorection')
          .doc(ids)
          .delete();
    }).toList();

  }
}