import 'package:flutter/material.dart';
import '2_home.dart';

class startClass extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(

    body:
     Container(
       /*
           decoration:  BoxDecoration(
           image: DecorationImage(
                 image: AssetImage('image/umi.png'),
                 fit: BoxFit.cover,
           )),
        */
           child:  Center(
                  child:ElevatedButton(
                      child: Text("ログイン",),
                    onPressed:(){
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => home(),),
                          );
                        },
                  ),
              ),
           ),

    );//Scaffold
    }//build
}//UiCreateClass