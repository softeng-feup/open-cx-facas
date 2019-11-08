import 'dart:ui';

class Talk {
  DateTime dateInitial;
  DateTime dateFinal;
  String name;
  String information;
  Color color;
  bool selected;

  Talk(this.dateInitial, this.dateFinal, this.name, this.information, this.color, this.selected);
}