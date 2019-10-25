class Talk {
  final String initialTime;
  final String finalTime;
  final String task;
  final String desc;
  bool selected;

  Talk(this.initialTime, this.finalTime, this.task, this.desc, bool selected) {
    this.selected = selected;
  }
}