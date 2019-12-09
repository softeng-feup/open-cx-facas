import 'package:flutter/material.dart';
import 'package:flutter_login_page/Model/Talk.dart';
import 'package:flutter_login_page/Model/User.dart';
import 'package:flutter_login_page/Screens/Recommended_Talks_Screen/List_Recommended_Talks.dart';

class MyRecommendedTalks extends StatefulWidget {
  final List<Talk> talkList;
  final User user;

  const MyRecommendedTalks({Key key, this.talkList, this.user}): super(key: key);

  @override
  _MyRecommendedTalksState createState() => _MyRecommendedTalksState();
}

class _MyRecommendedTalksState extends State<MyRecommendedTalks> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: RecommendedTalksPage(talkList: widget.talkList, user: widget.user,),
            )
          ],
        ),
    );
  }
}