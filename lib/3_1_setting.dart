import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '3_2_seting.dart';
import '4_1_add.dart';
import '5_1_hensyu.dart';
import '6_1_deleteG.dart';
import 'M/word.dart';
import 'model/3_2_wordcreatemodel.dart';
import 'model/3_1_foldercreatemodel.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

//「フォルダ」UI構築クラス

class setting extends StatelessWidget {
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TestModel>(
      create: (_) => TestModel()..TestModelmeso(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('【設定】フォルダ一覧'),
        ),
        body: Center(
          child: Consumer<TestModel>(builder: (context, model, child) {
            final List<foold>? books = model.test;

            if (books == null) {
              return CircularProgressIndicator();
            }
            final List<Widget> widgets = books
                .map(
                  (foold) => Slidable(        //スワイプしたいWidgetをSlidableでラップする
                    endActionPane: ActionPane( //endActionPaneプロパティ（右から左）
                      motion: DrawerMotion(), //motionプロパティでアニメーション表示を指定します。
                      children: [
                        SlidableAction(
                          onPressed: (value) async{
                            /*画面遷移を記述する*/
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Hensyu1(foold.fooldid,foold.ids)//●ここは編集の画面に遷移,
                                ),
                              );
                              model.TestModelmeso();
                            },
                          backgroundColor: Colors.green,
                          icon: Icons.settings,
                          label: '編集',
                        ),

                        SlidableAction(
                          onPressed: (value) async{
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Delete1(foold.fooldid,foold.ids)//●ここは編集の画面に遷移,
                              ),
                            );
                            model.TestModelmeso();
                          },
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                          label: '削除',
                        ),
                      ],
                    ),

                    child: Container(
                      decoration: new BoxDecoration(
                          border: new Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.grey))),
                      child: ListTile(
                          title: Text(
                            foold.fooldid,
                            style:
                                TextStyle(color: Colors.black, fontSize: 18.0),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      setting2(foold.fooldid,foold.ids)),
                            );
                          }), //listtile
                    ),
                  ),
                )
                .toList();
            return ListView(
              children: widgets,
            );
          }),
        ),
        floatingActionButton:
            Consumer<TestModel>(builder: (context, model, child) {
          return FloatingActionButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => add(),
                ),
              );
              model.TestModelmeso();
            },
            child: Icon(Icons.add),
          );
        }),
      ),
    );
  }
}
