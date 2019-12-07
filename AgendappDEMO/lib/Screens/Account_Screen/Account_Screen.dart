import 'package:flutter/material.dart';
import 'package:flutter_login_page/Model/Talk.dart';
import 'package:flutter_login_page/Model/User.dart';
import 'package:flutter_login_page/Screens/Login_Screen/login.dart';
import 'package:flutter_login_page/Screens/MenuOpen.dart';
import 'package:flutter_login_page/Screens/Account_Screen/Preferences_Screen.dart';
import 'package:flutter_login_page/Model/ThemeTalk.dart';
import 'package:flutter_login_page/Components/displayAllThemes.dart';
import 'package:flutter_login_page/Notification/notification_page.dart';

class MyAccountPage extends StatefulWidget {
  final List<Talk> talkList;
  final List<ThemeTalk> themesList;
  final User user;

  const MyAccountPage({Key key, this.talkList, this.themesList, this.user}) : super(key: key);

  @override
  MyAccountPageState createState() => MyAccountPageState();
}

final List<ThemeTalk> interests = [allThemes[1], allThemes[2], allThemes[3]];

class MyAccountPageState extends State<MyAccountPage> {

  @override
  void initState(){
    super.initState();
    // print(widget.talkList);
    // print(widget.themesList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              color: Colors.grey[100],
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.grey[100],
              // child: Icon(
              //   Icons.account_circle,
              //   size: 100.0,
              //   color: Colors.grey[600],
              // ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  widget.user.photo),
                radius: 60,
              ),
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.grey[100],
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.grey[100],
              child: Text(
                widget.user.name,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.grey[100],
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.grey[100],
              child: Text(
                widget.user.email,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.grey[100],
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.grey[200],
              height: 2,
            ),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Preferences',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return new PreferencesScreen(themesList: widget.themesList, user: user);
                }));
              },
                child: Container(
                  margin: const EdgeInsets.only(right: 20.0),
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              ),
            ]),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: displayAllThemes(interests),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Account Settings',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return NotificationPage(talkList: widget.talkList,talk: null);
                }));
              },
              child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    child: Icon(
                      Icons.notifications,
                      size: 20.0,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      'Manage Notifications',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return new LoginPage();
                }));
              },
              child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    child: Icon(
                      Icons.exit_to_app,
                      size: 20.0,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}