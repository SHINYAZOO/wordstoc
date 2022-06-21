import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '7_2_listfold.dart';

class PlaySetting extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
       child: DottedBorder(
          color: Color(0xFFD6D6D6), // 点線の色
          dashPattern: [ 15.0, // 点線を引く長さ
                         6.0 ],//点線の溝の長さ
          strokeWidth: 3.0, // 点線の
          child:SizedBox(
            width: 300,
            height: 150,
            child:ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListFold()),
                );
                },
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                elevation: 0,
                onPrimary: Color(0xFFD6D6D6),
             ),
              child:Center(
               child: Padding(
                padding:EdgeInsets.only(top: 50),
                  child:Column(
                    children:[
                      Text('フォルダを選択してください',style: TextStyle(color:Color(0xFFD6D6D6))),
                      Icon(Icons.add, color:Color(0xFFD6D6D6)),
                    ],
                  ),
               ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}