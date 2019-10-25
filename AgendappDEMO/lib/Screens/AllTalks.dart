import 'package:flutter/material.dart';
import 'package:flutter_login_page/Model/Talk.dart';

import 'list_all_talks.dart';
import 'list_talks.dart';

class MyAllTalksPage extends StatefulWidget {
  final List<Talk> talkList;

  const MyAllTalksPage({Key key, this.talkList}): super(key: key);

  @override
  _MyAllTalksPageState createState() => _MyAllTalksPageState();
}

class _MyAllTalksPageState extends State<MyAllTalksPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                "All Talks",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: AllTalkPage(talkList: widget.talkList),
            )
          ],
        )
    );
  }
}