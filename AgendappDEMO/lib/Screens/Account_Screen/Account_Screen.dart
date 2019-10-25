import 'package:flutter/material.dart';
import 'package:flutter_login_page/Model/Talk.dart';

class MyAccountPage extends StatefulWidget {
  final List<Talk> talkList;

  const MyAccountPage({Key key, this.talkList}) : super(key: key);

  @override
  MyAccountPageState createState() => MyAccountPageState();
}

class MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: Text(
        "Account: to be developed!",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
