import 'package:flutter/material.dart';
import 'Screens/login.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFF283593),
          accentColor: Color(0xFF283593),
          fontFamily: "Ubuntu"),
      home: LoginPage(), //todo MainPage()?
    );
  }
}
