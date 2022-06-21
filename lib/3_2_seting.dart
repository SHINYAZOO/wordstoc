import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '4_2_add.dart';
import 'M/word.dart';
import 'model/3_2_wordcreatemodel.dart';
import 'model/3_1_foldercreatemodel.dart';

class setting2 extends StatelessWidget {
  setting2(this.UserCreatefd,this.Usercreateid);

  final String UserCreatefd;
  final String Usercreateid;

  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WordCreateModel>(
      create: (_) => WordCreateModel(UserCreatefd,Usercreateid)..fetchWordList(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('【設定】単語一覧'),
        ),
        body: Center(
          child: Consumer<WordCreateModel>(builder: (context, model, child) {
            final List<word>? books = model.words;

            if (books == null) {
              return CircularProgressIndicator();
            }

            final List<Widget> widgets = books
                .map(
                  (word) => Container(
                    decoration: new BoxDecoration(
                        border: new Border(
                            bottom:
                                BorderSide(width: 1.0, color: Colors.grey))),
                    child: ListTile(
                        title: Text(
                          word.memorys,
                          style: TextStyle(color: Colors.black, fontSize: 18.0),
                        ),
                        onTap: () {
                        }),
                  ),
                )
                .toList();
            return ListView(
              children: widgets,
            );
          }),
        ),
        floatingActionButton:
            Consumer<WordCreateModel>(builder: (context, model, child) {
          return FloatingActionButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => add2(UserCreatefd,Usercreateid), //4_2add.dartファイルに飛ぶ
                ),
              );
              model.fetchWordList();
            },
            child: Icon(Icons.add),
          );
        }),
      ),
    );
  }
}
