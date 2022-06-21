import 'package:flutter/material.dart';
import '7_4_gameplay.dart';

class StartButton extends StatelessWidget {

  StartButton(this.fooldid,this.ids);
  String fooldid;
  dynamic ids;

   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.blueAccent,//Colors.orange, // 背景色設定
           body:Center(
               child:ElevatedButton(
                 child: Text("スタート"),
                 onPressed: ()
                   async{
                     /*画面遷移を記述する*/
                     await Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) => GamePlay(fooldid,ids)//●ここは編集の画面に遷移,
                       ),
                     );
                   },
                 style: ElevatedButton.styleFrom(
                   primary:Colors.greenAccent,//Colors.black, //ボタンの背景色
                 ),
               ),
      ),
     );
   }
  }









