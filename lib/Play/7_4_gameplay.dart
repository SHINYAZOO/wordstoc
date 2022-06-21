import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_stack/swipeable_stack.dart';
import 'package:wordstock/Play/7_5_gamedate.dart';
import '../2_home.dart';
import '7_1_playSetting.dart';
import '7_2_z_startbutton.dart';
import '7_3_gamemodel.dart';
import 'package:flip_card/flip_card.dart';
import '7_5_gamedate.dart';



class GamePlay extends StatelessWidget {

  String fooldid;
  dynamic ids;
  GamePlay(this.fooldid,this.ids);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _GamePlay(fooldid,ids),
    //  initialRoute: "/home",
      routes: <String, WidgetBuilder> {
        '/start': (BuildContext context) => new StartButton(fooldid,ids),
        '/home': (BuildContext context) => new home(),
      },



    );
  }
}

class _GamePlay extends StatelessWidget  {

  String fooldid;
  dynamic ids;
  _GamePlay(this.fooldid,this.ids);

  Widget build(BuildContext context) {

    return ChangeNotifierProvider<Gmaemodel>(
      create: (_) => Gmaemodel(fooldid,ids)..gamedateList(),
      child: Scaffold(
         body:
         Stack(
             children:[


        // Container(
           //child:Positioned.fill(
            // child: Image(
              //image: AssetImage("image/ox.png"),
             //),
           //),
         //),

         Container(
              child: Center(
                 child: Consumer<Gmaemodel>(builder: (context, model, child) {
                   final List<GameData>? books = model.words;

                   if (books == null) {
                     return CircularProgressIndicator();//リロード
                   }

                   late final _controller =  SwipeableStackController<GameData>();//GameData2にSwipeableStackIdentifiablを継承しなければならない
                   List<GameData> _cards = model.words!;//カードを使用する際のデータ



                   return
                     SafeArea(//全体の幅調整などに役立っているやつ１
                       child: LayoutBuilder(//全体の幅調整などに役立っているやつ２−１
                           builder: (context, constraints) {//全体の幅調整などに役立っているやつ２−２
                             return SingleChildScrollView(//画面外までUIがはみ出たら、SingleChildScrollViewを使う必要があります
                               child: ConstrainedBox(
                                 constraints: constraints,
                                 child: Column(
                                   children: [
                                     Expanded(//ExpandedというWidgetは、RowやColumnの子Widget間の隙間を目一杯埋めたいときにます。
                                       flex: 8,
                                       child: Padding(
                                         padding: const EdgeInsets.all(8),//四方すべてに 8 ピクセルずつ均等に余白を持たせます。
                                         child: SwipeableStack<GameData>(//SwipeableStackはカードを積み重ねるウィジェット
                                           //child: SwipableStack<GameData>(
                                           stackClipBehaviour: Clip.none,//親ウィジェットのサイズの境界を超えるように変更します
                                           controller: _controller,//スワイプアクションを制御し、最近のアクションを巻き戻すこともできます。(よくわからない)
                                           dataSet: _cards,
                                           builder: (context, data, constraints) { //stackClipBehaviour後の画面を再描画する
                                             return Center(
                                               child: ConstrainedBox(
                                                 constraints: constraints,
                                                 child: Center(
                                                   child: Stack(
                                                     children: [
                                                       getHantens(data.memorys,data.answer)
                                                     ],
                                                   ),
                                                 ),
                                               ),
                                             );
                                           },

                                           //スワイプした後の処理
                                           onSwipeCompleted:(data, direction) {
                                             dynamic T_memorys = data.memorys;
                                             dynamic T_answer = data.answer;
                                             int T_count = data.count;
                                             int T_t_yes = data.t_yes;
                                             int T_t_no = data.t_no;
                                             int T_t_flg = data.t_flg;
                                             final T_foldname = data.foldname;
                                             final T_id = data.id;

                                             // スワイプ方向それぞれに処理を記述します。
                                             switch (direction) {
                                               case SwipeDirection.left:
                                               // TODO: 左方向にスワイプした場合の処理
                                                 direction = null as SwipeDirection;

                                                 break;
                                               case SwipeDirection.right:
                                               // TODO: 右方向にスワイプした場合の処理
                                                 direction = null as SwipeDirection;

                                                 break;
                                               case SwipeDirection.up:
                                               // TODO: 上方向にスワイプした場合の処理
                                                 model.count();
                                                 T_count++;
                                                 T_t_yes++;
                                                 T_t_flg = 1; //1は直近の正解・2は直近の不正解
                                                 model.GameUpModels(T_memorys,T_answer,T_count, T_t_yes,T_t_no,T_t_flg, ids);
                                                 //単語の終わりかどうかの判定処理を記述し「最終カウント」なら終わりの処理を実行
                                                 //ここに処理を記述する

                                                 if(model.countList! < model.countS ){

                                                   showDialog(
                                                     barrierDismissible: false,
                                                     context: context,
                                                     builder: (context) {
                                                       return AlertDialog(
                                                         title: Text("終了"),
                                                         actions: [

                                                           ElevatedButton(
                                                             child: Text("ホームへ戻る"),
                                                             onPressed: ()
                                                             async{
                                                               await Navigator.push(context,
                                                                 MaterialPageRoute(
                                                                     builder: (context) => home()//●ここは編集の画面に遷移,
                                                                 ),
                                                               );
                                                             },
                                                           ),

                                                           ElevatedButton(
                                                             child: Text("もう一度挑戦"),
                                                             onPressed: ()
                                                             async{
                                                               await Navigator.push(context,
                                                                 MaterialPageRoute(
                                                                     builder: (context) => StartButton(fooldid,ids)
                                                                 ),
                                                               );
                                                             },
                                                           ),

                                                         ],
                                                       );
                                                     },
                                                   );
                                                 }


                                                 break;
                                               case SwipeDirection.down:
                                               // TODO: 下方向にスワイプした場合の処理
                                                 model.count();
                                                 T_count++;
                                                 T_t_no++;
                                                 T_t_flg = 2;//1は直近の正解・2は直近の不正解
                                                 model.GameUpModels(T_memorys,T_answer,T_count, T_t_yes,T_t_no,T_t_flg, ids);

                                                 //ここに処理を記述する
                                                 if(model.countList! < model.countS ){

                                                   showDialog(
                                                     barrierDismissible: false,
                                                     context: context,
                                                     builder: (context) {
                                                       return AlertDialog(
                                                         title: Text("終了"),
                                                         actions: [

                                                           ElevatedButton(
                                                             child: Text("ホームへ戻る"),
                                                             onPressed: ()
                                                             async{
                                                               await Navigator.push(context,
                                                                 MaterialPageRoute(
                                                                     builder: (context) => home()//●ここは編集の画面に遷移,
                                                                 ),
                                                               );
                                                             },
                                                           ),

                                                           ElevatedButton(
                                                             child: Text("もう一度挑戦"),
                                                             onPressed: ()
                                                             async{
                                                               await Navigator.push(context,
                                                                 MaterialPageRoute(
                                                                     builder: (context) => StartButton(fooldid,ids)
                                                                 ),
                                                               );
                                                             },
                                                           ),

                                                         ],
                                                       );
                                                     },
                                                   );
                                                 }
                                                 break;
                                             }
                                           },
                                         ),//★
                                       ),
                                     ),
                                     Text('${model.countS}/${model.countList}'),
                                   ],//★
                                 ),
                               ),
                             );
                           }),
                     );
                 }
                 ),
               )

                 ),



         ],
           ),








      ),
    );
  }
}
//**************************************//
//           getHantens()
//**************************************//

  Widget getHantens(dynamic memorys, dynamic answer) {
    return
      FlipCard(
        direction: FlipDirection.VERTICAL,
        // デフォルト設定　( HORIZONTAL:横<デフォルト>, VERTICAL:縦)//blueAccent
        speed: 500,
        // タップイベント
        front: Container(
          width: 300,
          height: 150,
          color: Colors.blueAccent,
          child: Center(
            child:Column(
              children:[
                Container(
                  child:Padding(
                    padding:EdgeInsets.only(top: 60),
                    child:Text(
                      memorys,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        back: Container(
          width: 300,
          height: 150,
          color: Colors.greenAccent,
          child: Center(
            child:Column(
                children:[
                    Container(
                      child:Padding(
                        padding:EdgeInsets.only(top: 60),
                        child:Text(
                              answer,
                              ),
                      ),
                    ),
                ],
              ),
          ),
        ),
      );

  }



