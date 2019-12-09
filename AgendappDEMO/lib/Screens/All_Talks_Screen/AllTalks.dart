import 'package:flutter/material.dart';
import 'package:flutter_login_page/Model/Talk.dart';
import 'package:flutter_login_page/Screens/Recommended_Talks_Screen/Recommended_Talks.dart';

import 'list_all_talks.dart';

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
            Expanded(
              child: AllTalkPage(talkList: widget.talkList),
            )
          ],
        ),
    );
  }
}