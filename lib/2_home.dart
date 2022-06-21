import 'package:flutter/material.dart';
import '3_1_setting.dart';
import '8_1_seiseki.dart';
import 'Play/7_1_playSetting.dart';
import 'Play/7_4_gameplay.dart';

class home extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
         Scaffold(
           body:
           Container(
             child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children:[
               Center(
                 child: SizedBox(
                   height: 200,
                   width: 200,
                     child:ElevatedButton(
                         child:Text("単語帳",
                           style: TextStyle(
                             color: Colors.white,
                           ),
                         ),
                         //color: Colors.blue,
                         onPressed: () {
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => PlaySetting()),//●
                           );
                         },
                         style: ElevatedButton.styleFrom(
                                  onPrimary: Colors.black, //押したときの色！！
                                ),
                     ),
                 ),
               ),

               SizedBox(
                 height: 20,
               ),


               Center(
                 child: SizedBox(
                   height: 200,
                   width: 200,
                   child:Container(
                     child:ElevatedButton(
                       onPressed: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => setting()),
                         );
                       },
                       child: Text("設定",
                         style: TextStyle(
                           color: Colors.white,
                         ),
                       ),
                       style: ElevatedButton.styleFrom(
                         onPrimary: Colors.black, //押したときの色！！
                       ),
                     ),
                   ),
                 ),
               ),


               SizedBox(
                 height: 20,
               ),

               Center(
                 child: SizedBox(
                   height: 200,
                   width: 200,
                   child:Container(
                     child:ElevatedButton(
                       onPressed: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => SeisekiHome()),
                         );
                       },
                       child: Text("成績表",
                         style: TextStyle(
                           color: Colors.white,
                         ),
                       ),
                       style: ElevatedButton.styleFrom(
                         onPrimary: Colors.black, //押したときの色！！
                       ),
                     ),
                   ),
                 ),
               ),







             ],
           ),
             /*
             decoration:  BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage('image/hawai.png'),
                   fit: BoxFit.cover,
                 )),
             　*/
             ),
           ),


    );


  }
}