import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/4_1_addcreatemodel.dart';
import 'model/4_2_addcreatemodel.dart';


class add2 extends StatelessWidget {
  add2(this.UserCreatefd,this.UserCreateid);

  final String UserCreatefd;
  final dynamic UserCreateid;

  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TangoAddModel>(
      create: (_) => (TangoAddModel(UserCreatefd,UserCreateid)),
      child: Scaffold(
        body: Center(
          child: Consumer<TangoAddModel>(builder: (context, model, child) {
            return AlertDialog(
              title: Text('単語作成'),
              content: Column(
                children: <Widget>[
                  TextField(
                    onChanged: (indate) {
                      //入力されたもじが入る
                      model.tangoname = indate;
                    },
                  ),
                  TextField(
                    onChanged: (inimidate) {
                      //入力されたもじが入る
                      model.iminame = inimidate;
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
                      await model.TgAdd();
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
