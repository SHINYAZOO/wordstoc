import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//DB_フォルダ追加クラス


class FoldeAddModel extends ChangeNotifier {

    String fooldname = '';
    String? id;

    FdAdd() async {
      await FirebaseFirestore.instance
          .collection('word')
          .add({
        'HAKONAME' : fooldname,
      });
    }
}
