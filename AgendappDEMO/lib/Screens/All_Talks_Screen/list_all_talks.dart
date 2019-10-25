import 'package:flutter/material.dart';
import 'package:flutter_login_page/Components/displayTime.dart';
import 'package:flutter_login_page/Model/Talk.dart';
import 'package:flutter_login_page/Components/displayContent.dart';

class AllTalkPage extends StatefulWidget {
  final List<Talk> talkList;

  const AllTalkPage({Key key, this.talkList}): super(key: key);

  @override
  _AllTalkPageState createState() => _AllTalkPageState();
}

class _AllTalkPageState extends State<AllTalkPage> {

  @override
  Widget build(BuildContext context) {
    double iconSize = 20;

    return ListView.builder(
      itemCount: widget.talkList.length,
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24),
          child: Row(
            children: <Widget>[
              displayTime(
                  widget.talkList[index].initialTime,
                  widget.talkList[index].finalTime),
              lineStyle(
                  context, iconSize, widget.talkList.length,
                  widget.talkList[index]),
              displayContent(widget.talkList[index])
            ],
          ),
        );
      },
    );
  }

  Widget lineStyle(
      BuildContext context, double iconSize, int listLength, Talk talk) {
    return Container(
      padding: const EdgeInsets.only(right: 10.0),
      child: new Checkbox(
        value: talk.selected,
        activeColor: new Color(0xFF283593),
        onChanged: (val) {
          setState(() {
            talk.selected = val;
          });
        },
      ),
    );
  }
}

