import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/4_1_addcreatemodel.dart';
import 'model/4_2_addcreatemodel.dart';
import 'model/5_1_hensyucreatemodel.dart';


class Hensyu1 extends StatelessWidget {
  Hensyu1(this.fooldid,this.ids);
  String fooldid;
  dynamic ids;


  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FoldeHensyuModel>(
      create: (_) => (FoldeHensyuModel()),
      child: Scaffold(
        body: Center(
          child: Consumer<FoldeHensyuModel>(builder: (context, model, child) {
            return AlertDialog(
              title: Text('フォルダ編集'),
              content: Column(
                children: <Widget>[
                  TextField(
                    onChanged: (inNewfold) {
                      //入力されたもじが入る+編集前の文字列が表示されるようにする
                      model.up = inNewfold;
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); //画面を閉じる
                  },
                  child: Text('キャンセル'),
                ),
                TextButton(
                  onPressed: () async {
                    try {
                      await model.Hensyu1Model(fooldid,ids);
                      Navigator.pop(context);
                    } catch (e) {}
                    ;
                  },
                  child: Text('OK'),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
