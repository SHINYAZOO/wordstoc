import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../M/word.dart';
import '../model/3_1_foldercreatemodel.dart';
import '7_2_z_startbutton.dart';
import '7_4_gameplay.dart';

//「フォルダ」選択一覧

class ListFold extends StatelessWidget {
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TestModel>(
      create: (_) => TestModel()..TestModelmeso(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('フォルダ選択一覧'),
        ),
        body: Center(

          child: Consumer<TestModel>(builder: (context, model, child) {
              final List<foold>? books = model.test;

              if (books == null) {
               return CircularProgressIndicator();
              }
              final List<Widget> widgets = books.map((foold) =>
                  ListTile(
                    title: Text(foold.fooldid),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  StartButton(foold.fooldid,foold.ids)),
                        );
                      }
                  ),
              ).toList();
              return ListView(
               children: widgets,
             );
          }),

        ),
      ),
    );
  }
}
