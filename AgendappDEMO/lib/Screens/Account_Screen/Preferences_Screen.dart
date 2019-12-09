import 'package:flutter/material.dart';
import 'package:flutter_login_page/Model/ThemeTalk.dart';
import 'package:flutter_login_page/Model/User.dart';


class PreferencesScreen extends StatefulWidget {
  final List<ThemeTalk> themesList;
  final User user;

  const PreferencesScreen({Key key, this.themesList, this.user}) : super(key: key);

  @override
  MyPreferencesScreen createState() => MyPreferencesScreen();
}
class MyPreferencesScreen extends State<PreferencesScreen>   {

  Widget displayThemeTalk(ThemeTalk theme) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(width: 2, color: theme.color),
      borderRadius: BorderRadius.all(Radius.circular(5)),
      boxShadow: [
        BoxShadow(
          color: Color(0x20000000), blurRadius: 5, offset: Offset(0, 3))
        ]
      ),
    child: Text(
      theme.name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: theme.color,
      )
    ),
  );
}

  Widget displayThemes(List<ThemeTalk> themes){
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(17, 0, 17, 0),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        runSpacing: 10,
        children: <Widget>[
          for(int i = 0; i < themes.length; i++)
            displayThemeTalk(themes[i])
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Preferences",
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
            Container(
              padding: EdgeInsets.fromLTRB(33, 36, 33, 32),
              child: Text(
                "Tell us what you're interested in!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          displayThemes(widget.user.preferredThemes),
          ],
        ),
      ),
    );
  }
}