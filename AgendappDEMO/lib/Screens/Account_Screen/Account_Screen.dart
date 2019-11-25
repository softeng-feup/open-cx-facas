import 'package:flutter/material.dart';
import 'package:flutter_login_page/Model/Talk.dart';
import 'package:flutter_login_page/Screens/Login_Screen/login.dart';
import 'package:flutter_login_page/Screens/MenuOpen.dart';
import 'package:flutter_login_page/Model/ThemeTalk.dart';
import 'package:flutter_login_page/Components/displayAllThemes.dart';
import 'package:flutter_login_page/Notification/notification_page.dart';

class MyAccountPage extends StatefulWidget {
  final List<Talk> talkList;

  const MyAccountPage({Key key, this.talkList}) : super(key: key);

  @override
  MyAccountPageState createState() => MyAccountPageState();
}

final List<ThemeTalk> interests = [allThemes[1], allThemes[2], allThemes[3]];

class MyAccountPageState extends State<MyAccountPage> {
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
                    'https://yt3.ggpht.com/a/AGF-l791z2rgw2RhBFQ2vnnI3wuxwMdZSNXI3U1LgQ=s176-c-k-c0x00ffffff-no-rj-mo'),
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
                'Tiago Miller',
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
                'tigasmiller@gmail.com',
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
              Container(
                margin: const EdgeInsets.only(right: 20.0),
                child: Text(
                  'Edit',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w100,
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
                  return NotificationPage();
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