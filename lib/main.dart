import 'package:flutter/material.dart';
import 'package:wordstock/1_start.dart';
import 'package:firebase_core/firebase_core.dart';
import '3_1_setting.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();//初期化という認識
  await Firebase.initializeApp();//初期化という認識
  runApp(App());
}
class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home:startClass(),
    );
  }
}