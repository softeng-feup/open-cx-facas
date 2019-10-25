import 'package:flutter/material.dart';
import 'package:flutter_login_page/Components/displayTime.dart';
import 'package:flutter_login_page/Model/Talk.dart';
import 'package:flutter_login_page/Components/displayContent.dart';

class TalkPage extends StatefulWidget {
  final List<Talk> talkList;

  const TalkPage({Key key, this.talkList}): super(key: key);

  @override
  _TalkPageState createState() => _TalkPageState();
}

class _TalkPageState extends State<TalkPage> {

  @override
  Widget build(BuildContext context) {
    double iconSize = 20;

    List<Talk> selectedTalks = new List<Talk>();

    for(Talk talk in widget.talkList){
      if(talk.selected)
        selectedTalks.add(talk);
    }

    return ListView.builder(
      itemCount: selectedTalks.length,
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) {

        if(!selectedTalks[index].selected)
          return null;

        return Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24),
          child: Row(
            children: <Widget>[
              displayTime(
                  selectedTalks[index].initialTime,
                  selectedTalks[index].finalTime),
              lineStyle(
                  context, iconSize, selectedTalks.length,
                  selectedTalks[index]),
              displayContent(selectedTalks[index])
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

