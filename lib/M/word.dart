

class word {

  word(this.memorys, this.answer, this.count, this.t_yes, this.t_no , this.t_flg, this.foldname);

  dynamic memorys;
  dynamic answer;
  int count;
  int t_yes;
  int t_no;
  int t_flg;
  dynamic foldname;


}


//コレクションを確保
class foold {
  foold(this.fooldid,this.ids);
  String fooldid;
  dynamic ids;
}

//サブのコレクションを確保
class id {
  id(this.fid);
  String fid;
}
