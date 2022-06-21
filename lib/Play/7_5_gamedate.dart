import 'package:flutter/src/material/list_tile.dart';
import 'package:swipeable_stack/swipeable_stack.dart';

class GameData extends SwipeableStackIdentifiable {

  GameData(this.memorys, this.answer, this.count, this.t_yes, this.t_no, this.t_flg, this.foldname,this.id);

  dynamic memorys;
  dynamic answer;
  int count;
  int t_yes;
  int t_no;
  int t_flg;
  dynamic foldname;
  late String  id;

}

