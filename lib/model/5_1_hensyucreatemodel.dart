import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../M/word.dart';

//DB_アップデートクラス

class FoldeHensyuModel extends ChangeNotifier {
  dynamic up = '';

  Hensyu1Model(String fooldid, dynamic id) async {

    HensyuFd(fooldid, id);
    await FirebaseFirestore.instance
        .collection('word')
        .doc(id)
        .update({
      'HAKONAME': up,
    });
  }

  HensyuFd(String fooldid, dynamic id) async {
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
                .update({
                 'foldname':up,
            });
          }).toList();

  }
}