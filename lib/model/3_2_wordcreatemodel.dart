import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../M/word.dart';

//DB_取得して表示するクラス（単語）

class WordCreateModel extends ChangeNotifier {
  WordCreateModel(this.UserCreatefd,this.Usercreateid);

  String UserCreatefd;
  dynamic Usercreateid;
  List<word>? words;

  fetchWordList() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('word')
        .doc(Usercreateid)
        .collection('subcorection')
        .where('foldname', isEqualTo: UserCreatefd ).get();

    //docの箇所は前の画面から値を受け取りながら汎用性を高くする　また、値がNULLの場合のことも考える

    final List<word> wordss = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> wordsss = document.data() as Map<String, dynamic>;

      final dynamic memorys = wordsss['memorys'];
      final dynamic answer = wordsss['answer'];
      final int count = wordsss['count'];
      final int t_yes = wordsss['t_yes'];
      final int t_no = wordsss['t_no'];
      final int t_flg = wordsss['t_flg'];
      final dynamic foldname = wordsss['foldname'];

      return word(memorys, answer, count, t_yes, t_no, t_flg, foldname);
    }).toList();
    this.words = wordss;
    notifyListeners(); //ここでChangeNotifierの伏線を回収　ChangeNotifierを使用した場合　何かしらのタイミングでこれを記述する（何かしらとは、多分、DBの変更箇所を指定する範囲の最後の行）
  }
}
