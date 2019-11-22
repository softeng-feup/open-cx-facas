import 'package:flutter/material.dart';
import 'package:flutter_login_page/Widget/local_notification_widget.dart';
import 'Screens/Login_Screen/login.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Color(0xFF5b78f5),
          primaryColor: Color(0xFF5b78f5),
          cursorColor: Color(0xFF5b78f5),
          textSelectionColor: Color(0xFF5b78f5),
          textSelectionHandleColor: Color(0xFF5b78f5),
          fontFamily: "Ubuntu"),
      home: LoginPage(), //todo MainPage()?
    );
  }
}
