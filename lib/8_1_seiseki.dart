import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SeisekiHome extends StatelessWidget {
  const SeisekiHome({Key? key}) : super(key: key);

   static const String _title = 'BottomNavBar Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,//開発中のSlowModeバナーを非表示にする
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  var _pages = <Widget>[
    Container(
      child: Text('ニュース'),
      alignment: Alignment.center,
    ),
    Container(
      child: Text('フォロー'),
      alignment: Alignment.center,
      color: Colors.lightBlue,
    ),
    Container(
      child: Text('特集'),
      alignment: Alignment.center,
      //color: Colors.pink.withOpacity(20),
    ),
    Container(
      child: Text('番組'),
      alignment: Alignment.center,
      //color: Colors.pink.withOpacity(0.5),
    ),
    Container(
      child: Text('トピックス'),
      alignment: Alignment.center,
      //color: Colors.pink.withOpacity(0.5),
    ),
  ];


  void _onItemTapped(int index) {//ボタンを押下した時にINDEXの数字が入ってくる
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(//BottomNavigationBarウィジェット
        showUnselectedLabels:true,//Falseの場合は、ラベルを非表示にできる
        currentIndex: _selectedIndex,//今現在アクティブなページ番号を指定します。勝手に数字をつけて管理してくれる。
        onTap: _onItemTapped, //タップした時の動作です 米上記のメソッドを呼び出している
        items: const <BottomNavigationBarItem>[//BottomNavBarの実際のページになる部分のアイテムです
          BottomNavigationBarItem(//「items:」プロパティーを使用したら使用できる→ BottomNavigationBarItemウィジェット
            icon: Icon(Icons.description,),//そのitemに表示されるアイコンです。
            label: 'ニュース',//押下した時に表示される文字列
            //activeIcon: Icon(Icons.book_online),//ボタンを押下した時に表示するアイコン
            //tooltip: "This is a Book Page",//アイコンを長押ししたら出てくる文字列
            activeIcon: Icon(Icons.description,color:Colors.black),
            backgroundColor: Colors.grey,//押下した時に変わる色の色
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account),
            activeIcon: Icon(Icons.supervisor_account,color:Colors.black),
            backgroundColor: Colors.grey,
            label: 'フォロー',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.import_contacts),
            activeIcon: Icon(Icons.import_contacts,color:Colors.black),
            label: '特集',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_filled),
            activeIcon: Icon(Icons.play_circle_filled,color:Colors.black),
            label: '番組',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            activeIcon: Icon(Icons.forum,color:Colors.black),
            label: 'トピックス'
          ),
        ],

        type: BottomNavigationBarType.shifting,
        // ここで色を設定していても、shiftingにしているので
        // Itemの方のbackgroundColorが勝ちます。
        //backgroundColor: Colors.green,
        //enableFeedback: true,//音の設定
        // IconTheme系統の値が優先されます。
        //iconSize: 18,//BottomNavBarに設定されている全てのアイコンのサイズを決定します
        // 横向きレイアウトは省略します。
        // landscapeLayout: 省略
        //selectedFontSize: 10,//itemが選択された時のそのフォントサイズを決定します。
        //selectedIconTheme: const IconThemeData(size: 30, color: Colors.green),//itemが選択された時のそのIconThemeを決定します。※このプロパティを選択した場合、unselectedの方も入力必須となります。
        //selectedLabelStyle: const TextStyle(color: Colors.pink),////押下した時の色がレッドやないかい！
        // ちなみに、LabelStyleとItemColorの両方を選択した場合、ItemColorが勝ちます。
        selectedItemColor: Colors.black,//アイコンを押下した時の色
        //unselectedFontSize: 0,//アイコンを押下した時のMOVE処理(大きさの動き)
        //unselectedIconTheme: const IconThemeData(size: 25, color: Colors.pink),//選択されていない時のアイコンの色
        //unselectedLabelStyle: const TextStyle(color: Colors.purple),
        // IconTheme系統の値が優先されるのでこの値は適応されません。
        //unselectedItemColor: Colors.pink,
      ),
    );
  }
}
