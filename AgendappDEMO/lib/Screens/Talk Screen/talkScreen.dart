import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_page/Model/Talk.dart';
import 'package:flutter_login_page/Model/ThemeTalk.dart';
import 'package:intl/intl.dart';

class TalkScreen extends StatefulWidget {
  final Talk talk;

  const TalkScreen({Key key, this.talk}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<TalkScreen> {
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Talk",
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFF28316C),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            informationTop(widget.talk),
            showDescription(widget.talk),
            showSpeakers(widget.talk),
            showLocation(widget.talk),
          ],
        ),
      ),
    );
  }
}

Widget informationTop(Talk talk) {
  return Container(
      padding:
          EdgeInsets.only(top: 15.0, left: 20.0, right: 15.0, bottom: 20.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              talk.name,
              style: TextStyle(fontSize: 24.0, color: Colors.black),
            ),
            showAllThemes(talk.themes),
            Text(
              new DateFormat("EEE, MMM d 'at' HH:mm").format(talk.dateInitial),
              style: TextStyle(fontSize: 14.0, color: Colors.black),
            ),
            Text(
              talk.location,
              style: TextStyle(fontSize: 14.0, color: Colors.black),
            ),
          ]));
}

Widget showAllThemes(List<ThemeTalk> themes) {
  return Container(
      height: 76.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: themes.length,
        itemBuilder: (context, index) {
          return showTheme(themes[index]);
        },
      ));
}

Widget showTheme(ThemeTalk theme) {
  return Container(
      padding: const EdgeInsets.only(right: 10, left: 0, top: 20, bottom: 20),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 2, color: theme.color),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                  color: Color(0x20000000), blurRadius: 5, offset: Offset(0, 3))
            ]),
        child: Text(theme.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: theme.color,
              shadows: [
                Shadow(
                  blurRadius: 5.0,
                  color: Color(0xFFD8D8D8),
                )
              ],
            )),
      ));
}

Widget showDescription(Talk talk) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
            width: double.infinity,
            child: Container(
              padding:
                  EdgeInsets.only(top: 15, bottom: 15, left: 20.0, right: 15.0),
              color: Color(0xffEFEFEF),
              child: Text(
                'Description',
                style: TextStyle(fontSize: 20.0, color: Color(0xff6B6B6B)),
              ),
            )),
        Container(
            padding:
                EdgeInsets.only(top: 20, bottom: 15, left: 20.0, right: 15.0),
            child: Text(
              talk.information,
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            )),
      ]);
}

Widget showSpeakers(Talk talk) {
  return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        SizedBox(
            width: double.infinity,
            child: Container(
              padding:
                  EdgeInsets.only(top: 15, bottom: 15, left: 20.0, right: 15.0),
              color: Color(0xffEFEFEF),
              child: Text(
                'Speakers',
                style: TextStyle(fontSize: 20.0, color: Color(0xff6B6B6B)),
              ),
            )),
        showSpeakersName(talk.speakers)
      ]);
}

Widget showSpeakersName(List<String> speakers) {
  return ListView.builder(
    physics: ClampingScrollPhysics(),
    padding: EdgeInsets.only(top: 15, bottom: 15, left: 20.0, right: 15.0),
    shrinkWrap: true,
    itemCount: speakers.length,
    itemBuilder: (context, index) {
      return Text(speakers[index],
          style: TextStyle(fontSize: 18.0, color: Colors.black));
    },
  );
}

Widget showLocation(Talk talk) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
            width: double.infinity,
            child: Container(
              padding:
                  EdgeInsets.only(top: 15, bottom: 15, left: 20.0, right: 15.0),
              color: Color(0xffEFEFEF),
              child: Text(
                'Location',
                style: TextStyle(fontSize: 20.0, color: Color(0xff6B6B6B)),
              ),
            )),
        Container(
            padding: EdgeInsets.only(top: 20, bottom: 15, left: 20.0),
            child: Text(
              talk.location,
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            )),
      ]);
}
