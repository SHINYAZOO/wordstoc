import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/4_1_addcreatemodel.dart';

class add extends StatelessWidget {
  Widget build(BuildContext context){
    return ChangeNotifierProvider<FoldeAddModel>(
      create: (_) => (FoldeAddModel()),
    child: Scaffold(
      body:Center(
       child: Consumer<FoldeAddModel>(builder: (context, model, child) {
        return AlertDialog(
           title: Text('フォルダ作成'),
           content: TextField(
             onChanged: (intextdate) {
               //入力されたもじが入る
               model.fooldname = intextdate;
             },
           ),
           actions: [
             TextButton(
                onPressed: () {
                Navigator.pop(context); //画面を閉じる
                },
                  child: Text('キャンセル'),
             ),
             TextButton(
               onPressed: () async{
                try {
                  await  model.FdAdd();
                  Navigator.pop(context);
               } catch (e) {};
               },
              child: Text('OK'),
             ),
           ],
         );

       }
      ),
   ),
  ),
    );

  }
}
