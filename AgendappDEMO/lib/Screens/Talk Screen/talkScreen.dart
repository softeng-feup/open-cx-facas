import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_page/Model/Talk.dart';
import 'package:intl/intl.dart';

class TalkScreen extends StatefulWidget {

  final Talk talk;

  const TalkScreen({Key key, this.talk}): super(key: key);

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            informationTop(widget.talk),
            showDescription(widget.talk),
            showSpeakers(),
            showLocation(),
          ],
        ),
      ),
    );
  }
}

Widget informationTop(Talk talk) {
  return Container(
    padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 15.0, bottom: 20.0),
    child:
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(
        talk.name,
        style: TextStyle(fontSize: 24.0, color: Colors.black),
      ),
      SizedBox(
        height: 50.0,
      ),
      Text(
        new DateFormat("EEE, MMM d 'at' HH:mm").format(talk.dateInitial),
        style: TextStyle(fontSize: 14.0, color: Colors.black),
      ),
      Text(
        'Room 101',
        style: TextStyle(fontSize: 14.0, color: Colors.black),
      ),
    ]),
  );
}

Widget showDescription(Talk talk) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.only(top: 15, bottom: 15, left: 20.0, right: 15.0),
              color: Color(0xffEFEFEF),
              child: Text(
                'Description',
                style: TextStyle(fontSize: 20.0, color: Color(0xff6B6B6B)),
              ),
            )),
        Container(
            padding: EdgeInsets.only(top: 20, bottom: 15, left: 20.0, right: 15.0),
            child: Text(
              talk.information,
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            )),
      ]);
}

Widget showSpeakers() {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.only(top: 15, bottom: 15, left: 20.0, right: 15.0),
              color: Color(0xffEFEFEF),
              child: Text(
                'Speakers',
                style: TextStyle(fontSize: 20.0, color: Color(0xff6B6B6B)),
              ),
            )),
        Container(
            padding: EdgeInsets.only(top: 20, bottom: 15, left: 20.0, right: 15.0),
            child: Text(
              'SpeakersSpeakersSpeakers'
                  'SpeakersSpeakersSpeakersSpeakers'
                  'SpeakersSpeakersSpeakersSpeakers',
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            )),
      ]);
}

Widget showLocation() {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.only(top: 15, bottom: 15, left: 20.0, right: 15.0),
              color: Color(0xffEFEFEF),
              child: Text(
                'Location',
                style: TextStyle(fontSize: 20.0, color: Color(0xff6B6B6B)),
              ),
            )),
        Container(
            padding: EdgeInsets.only(top: 20, bottom: 15, left: 20.0),
            child: Text(
              'Room 101',
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            )),
      ]);
}


