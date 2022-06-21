import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../M/word.dart';
import '7_5_gamedate.dart';

//DB_取得して表示するクラス（単語）

class Gmaemodel extends ChangeNotifier {
  Gmaemodel(this.fooldid,this.ids);
  String fooldid;
  dynamic ids;
  int idcounter = 0;
  List<GameData>? words;
  int? countList;

  int countS = 1;



  //late List<GameData2>  dd;

  gamedateList() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('word')
        .doc(ids)
        .collection('subcorection')
        .where('foldname', isEqualTo: fooldid ).get();

    //List<GameData2>? cc;

    final List<GameData> wordss = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> wordsss = document.data() as Map<String, dynamic>;

      final dynamic memorys = wordsss['memorys'];
      final dynamic answer = wordsss['answer'];
      final int count = wordsss['count'];
      final int t_yes = wordsss['t_yes'];
      final int t_no = wordsss['t_no'];
      final int t_flg = wordsss['t_flg'];
      final dynamic foldname = wordsss['foldname'];


      idcounter++;
      String str = idcounter.toString();

      //cc = GameData2.initialDeck(memorys,answer,count,t_yes,t_no,t_flg,foldname,str)   ;
      return GameData(memorys, answer, count, t_yes, t_no, t_flg, foldname,str);
    }).toList();

    this.words = wordss;
    countList = words!.length;
    //this.dd    = cc!;
    notifyListeners(); //ここでChangeNotifierの伏線を回収　ChangeNotifierを使用した場合　何かしらのタイミングでこれを記述する（何かしらとは、多分、DBの変更箇所を指定する範囲の最後の行）
  }

/*＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊*/
//UpDataメソッド
/*＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊*/
  GameUpModels(dynamic memorys, dynamic answer, int count,
               int t_yes, int t_no, int t_flg, dynamic ids,)  async {
    QuerySnapshot snapshot =
    await FirebaseFirestore.instance
        .collection('word')
        .doc(ids) //上記クラスからいただけ
        .collection('subcorection')
        .where('memorys', isEqualTo: memorys ) //引数に合わせて変数を修正する
        .where('answer', isEqualTo: answer ) //引数に合わせて変数を修正する
        .get();

    snapshot.docs.map((DocumentSnapshot document) {
      final dynamic tangoids = document.id;
      FirebaseFirestore.instance
          .collection('word')
          .doc(ids)
          .collection('subcorection')
          .doc(tangoids)
          .update({
        'count':count, //GameUpModelの引数からいただけ
        't_yes':t_yes, //GameUpModelの引数からいただけ
        't_no':t_no,  //GameUpModelの引数からいただけ
        't_flg':t_flg, //GameUpModelの引数からいただけ
      });
    }).toList();

  }


   count(){

     countS++;
     notifyListeners();

  }


}