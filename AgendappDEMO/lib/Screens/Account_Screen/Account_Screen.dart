import 'package:flutter/material.dart';
import 'package:flutter_login_page/Model/Talk.dart';
import 'package:flutter_login_page/Notification/notification_page.dart';

class MyAccountPage extends StatefulWidget {
  final List<Talk> talkList;

  const MyAccountPage({Key key, this.talkList}) : super(key: key);

  @override
  MyAccountPageState createState() => MyAccountPageState();
}

class MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton.icon(
          color: Color(0xFF28316C),
          icon: Icon(Icons.access_alarms), //`Icon` to display
          label: Text('Manage Notifications'), //`Text` to display
          textColor: Colors.white,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute<Null>(builder: (BuildContext context){
              return new NotificationPage();
            }));
          },
        ),
      ),
    );
  }
}
