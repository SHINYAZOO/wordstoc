import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/4_1_addcreatemodel.dart';
import 'model/4_2_addcreatemodel.dart';
import 'model/5_1_hensyucreatemodel.dart';
import 'model/6_1_deletecreatemodel.dart';

class Delete1 extends StatelessWidget {
  Delete1(this.fooldid,this.ids);
  String fooldid;
  dynamic ids;


  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DeleteModel1>(
      create: (_) => (DeleteModel1()),
      child: Scaffold(
        body: Center(
          child: Consumer<DeleteModel1>(builder: (context, model, child) {
            return AlertDialog(
              title: Text('フォルダ削除しますか'),
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
                      await model.DeleteCreateModel1(fooldid,ids);
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
