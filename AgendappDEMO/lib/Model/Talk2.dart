class Talk2 {
  final String day;
  final String initialTime;
  final String finalTime;
  final String task;
  final String desc;
  bool selected;

  Talk2(this.day, this.initialTime, this.finalTime, this.task, this.desc, bool selected) {
    this.selected = selected;
  }
}