import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class Event {
  final String initialTime;
  final String finalTime;
  final String task;
  final String desc;
  bool selected;

  Event(this.initialTime, this.finalTime, this.task, this.desc, bool selected) {
    this.selected = selected;
  }
}

final List<Event> _eventList = [
  new Event("08:00", "09:00", "Have coffe with Sam", "Personal", true),
  new Event("10:00", "11:00", "Meet with sales", "Work", true),
  new Event("12:00", "13:00", "Call Tom about appointment", "Work", true),
  new Event("14:00", "15:00", "Fix onboarding experience", "Work", true),
  new Event("16:00", "16:00", "Edit API documentation", "Personal", true),
  new Event("18:00", "17:00", "Setup user focus group", "Personal", true),
];

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    double iconSize = 20;

    return ListView.builder(
      itemCount: _eventList.length,
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24),
          child: Row(
            children: <Widget>[
              _displayTime(
                  _eventList[index].initialTime, _eventList[index].finalTime),
              _lineStyle(
                  context, iconSize, _eventList.length, _eventList[index]),
              _displayContent(_eventList[index])
            ],
          ),
        );
      },
    );
  }

  Widget _displayContent(Event event) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
        child: Container(
          padding: const EdgeInsets.all(14.0),
          height: 86,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                    color: Color(0x20000000),
                    blurRadius: 5,
                    offset: Offset(0, 3))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                event.task,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12,
              ),
              Text(event.desc)
            ],
          ),
        ),
      ),
    );
  }

  Widget _displayTime(String initialTime, String finalTime) {
    return Container(
        padding: const EdgeInsets.only(left: 13.0, right: 10.0, bottom: 10),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1.0, color: Color(0xFFFF000000))),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(initialTime),
              SizedBox(
                height: 12,
              ),
              Text(finalTime)
            ]));
  }

  Widget _lineStyle(
      BuildContext context, double iconSize, int listLength, Event event) {
    return Container(
      padding: const EdgeInsets.only(right: 10.0),
      child: new Checkbox(
        value: event.selected,
        onChanged: (val) {
          setState(() {
            event.selected = val;
          });
        },
      ),
    );
  }
}
