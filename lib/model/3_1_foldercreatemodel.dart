import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../M/word.dart';
import '../M/word.dart';
import '../M/word.dart';

class TestModel extends ChangeNotifier{
  List<foold>? test;

  void TestModelmeso() async {
    final QuerySnapshot snshot =
    await FirebaseFirestore.instance
        .collection('word')
        .get();

    final List<foold> wordss = snshot.docs.map((DocumentSnapshot document) {//DocumentSnapshot documentのdocumentは受け皿→下記の処理結果がここに入る
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;

      final String cid = data['HAKONAME'];
      final dynamic ids = document.id;

      return foold(cid,ids);

    }).toList();
    this.test = wordss;

    notifyListeners();//ここでChangeNotifierの伏線を回収　ChangeNotifierを使用した場合　何かしらのタイミングでこれを記述する（何かしらとは、多分、DBの変更箇所を指定する範囲の最後の行）
  }

  }











