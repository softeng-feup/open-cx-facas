import 'package:flutter/material.dart';
import 'package:flutter_login_page/Model/Talk.dart';

class MySchedulePage extends StatefulWidget {
  final List<Talk> talkList;

  const MySchedulePage({Key key, this.talkList}) : super(key: key);

  @override
  MySchedulePageState createState() => MySchedulePageState();
}

class MySchedulePageState extends State<MySchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: Text(
        "TESTE",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
