
import 'package:flutter/material.dart';
import 'package:flutter_login_page/Model/Talk.dart';
import 'package:flutter_login_page/Screens/Account_Screen/Account_Screen.dart';
import 'package:flutter_login_page/Screens/Schedule_Screen/schedule_screen.dart';
import 'package:flutter_login_page/Screens/All_Talks_Screen/AllTalks.dart';
import 'package:flutter_login_page/Screens/Schedule_List_Screen/home.dart';

final List<Talk> _talkList = [
  new Talk(new DateTime(2019, 12, 8, 8, 0), new DateTime(2019, 12, 8, 9, 30), "Drones and food delivery: A marriage made in Heaven", "There are so many food delivery unicorns, but could getting your food delivery be bad for the planet?", Color(0xFF1E90FF), "Room 101", false),
  new Talk(new DateTime(2019, 12, 8, 12, 0), new DateTime(2019, 12, 8, 13, 0), "Call Tom about appointment", "Work", Color(0xFFFF0000), "Room 102", true),
  new Talk(new DateTime(2019, 12, 8, 14, 0), new DateTime(2019, 12, 8, 15, 0), "Fix onboarding experience", "Work", Color(0xFF008000), "Room 103", false),
  new Talk(new DateTime(2019, 12, 8, 16, 0), new DateTime(2019, 12, 8, 17, 0), "Edit API documentation", "Personal", Color(0xFFFFFF00), "Room 104", false),
  new Talk(new DateTime(2019, 12, 10, 9, 0), new DateTime(2019, 12, 10, 10, 0), "Drones and food delivery: A marriage made in Heaven", "There are so many food delivery unicorns, but could getting your food delivery be bad for the planet?", Color(0xFFFFFF00), "Room 105", true),
  new Talk(new DateTime(2019, 12, 10, 16, 0), new DateTime(2019, 12, 10, 17, 30), "Edit API documentation", "Personal", Color(0xFFFF0000), "Room 106", false),
];


class MenuPage extends StatefulWidget {
  MenuPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MenuPageState createState() => _MenuPageState();
}


class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 1;
  int _selectedPageIndex = 1;
  String texto = "Schedule";
  bool _isVisible = false;
  bool _isCalendar;

  void _onItemTapped(int index) {

    setState(() {
      _selectedIndex = index;
      if(index == 0){
        texto = "Schedule";
        _isVisible = true;
      }
      else if(index == 1){
        texto = "All Talks";
        _isVisible = false;
      }
      else if (index == 2){
        texto = "Account";
        _isVisible = false;
      }
      this.sheduleIcon = new Icon(Icons.calendar_today);
      _isCalendar = false;
      _selectedPageIndex = _selectedIndex;
    });
  }

  final List<Widget> _children = [
    MyHomePage(talkList: _talkList),
    MyAllTalksPage(talkList: _talkList),
    MyAccountPage(),
    MySchedulePage(talkList: _talkList),
  ];

  Icon sheduleIcon = new Icon (Icons.calendar_today);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          texto,
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFF28316C),
      ),

      body:_children[_selectedPageIndex],

      floatingActionButton: Visibility(
        visible: _isVisible,
        child: Container(
          height: 50,
          child: FloatingActionButton(
            backgroundColor: Color(0xFF28316C),
            child: IconButton(
              icon: sheduleIcon,
              onPressed: () {
                setState((){
                  if(_isCalendar){
                    this.sheduleIcon = new Icon(Icons.calendar_today);
                    _selectedPageIndex = 0;
                    _isCalendar = false;
                  }
                  else{
                    this.sheduleIcon = new Icon(Icons.format_list_bulleted);
                    _selectedPageIndex = 3;
                    _isCalendar = true;
                  }
                });
              },
            ),
            onPressed: () {
              null;
            },
          ),
        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.yellow,
            icon: Icon(Icons.access_time),
            title: Text(
              'Schedule',
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.content_copy),
            title: Text(
              'All talks',
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.account_circle),
            title: Text(
              'Account',
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Color(0xFF28316C),
        selectedItemColor: Color(0xFF28316C),
        selectedIconTheme: IconThemeData(size: 38, color: Color(0xFF28316C)),
        unselectedIconTheme: IconThemeData(size: 25, color: Color(0x9F28316C)),
        onTap: _onItemTapped,
      ),
    );
  }
}