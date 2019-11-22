import 'dart:ui';

import 'package:flutter_login_page/Model/Theme.dart';

class Talk {
  DateTime dateInitial;
  DateTime dateFinal;
  String name;
  String information;
  Color color;
  bool selected;
  List<String> speakers = new List<String>();
  String location = "";
  List<Theme> themes = new List<Theme>();

  Talk(this.dateInitial, this.dateFinal, this.name, this.information, this.color, this.location, this.selected){

    speakers.add("Speaker1");
    speakers.add("Speaker2");
  }

  void addSpeaker(String speaker){

    this.speakers.add(speaker);
  }
}