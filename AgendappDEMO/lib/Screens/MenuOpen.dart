import 'package:flutter/material.dart';
import 'package:flutter_login_page/Model/Talk.dart';
import 'package:flutter_login_page/Model/ThemeTalk.dart';
import 'package:flutter_login_page/Model/User.dart';
import 'package:flutter_login_page/Screens/Account_Screen/Account_Screen.dart';
import 'package:flutter_login_page/Screens/Recommended_Talks_Screen/Recommended_Talks.dart';
import 'package:flutter_login_page/Screens/Schedule_Screen/schedule_screen.dart';
import 'package:flutter_login_page/Screens/All_Talks_Screen/AllTalks.dart';
import 'package:flutter_login_page/Screens/Schedule_List_Screen/home.dart';
import 'package:flutter_login_page/Model/Globals.dart' as globals;

final List<ThemeTalk> allThemes = [
  new ThemeTalk("Auto/Tech", Color(0xFF1E90FF)),
  new ThemeTalk("Sports", Color(0xFFFF0000)),
  new ThemeTalk("Deep Tech", Color(0xFF00CA00)),
  new ThemeTalk("Pitch!", Color(0xFFFFA000)),
];

final List<ThemeTalk> userThemes = [];

final List<String> speakers = [
  "Alexander Zosel",
  "Michael Kratsios",
  "Pedro Miranda",
  "Laurie Segall",
  "Marcelo Rebelo de Sousa"
];

final List<ThemeTalk> interests = [allThemes[1], allThemes[2], allThemes[3]];


final user = new User("Tiago Miller", "tigasmiller@gmail.com", userThemes, "https://yt3.ggpht.com/a/AGF-l791z2rgw2RhBFQ2vnnI3wuxwMdZSNXI3U1LgQ=s176-c-k-c0x00ffffff-no-rj-mo");

final List<Talk> _talkList = [
  new Talk(globals.talkId++,new DateTime(2019, 12, 8, 8, 0), new DateTime(2019, 12, 8, 9, 30), "Drones and food delivery: A marriage made in Heaven", "There are so many food delivery unicorns, but could getting your food delivery be bad for the planet?", "Room 101", false, false, [speakers[0], speakers[3]], [allThemes[0]]),
  new Talk(globals.talkId++,new DateTime(2019, 12, 8, 12, 0), new DateTime(2019, 12, 8, 13, 0),
      "Breakout startups",
      "Are these the companies everyone will be talking about in 2020? Dozens of the world’s leading investors think so. Each morning and lunchtime on Centre Stage you’ll get an introduction to some of the world’s most exciting early and growth stage startups. Each of the startups have been hand-selected by some of the world’s most successful investors. You’re in for a treat.",
      "Room 102", true, true, [speakers[1]], [allThemes[1], allThemes[2], allThemes[3]]),
  new Talk(globals.talkId++,new DateTime(2019, 12, 8, 14, 0), new DateTime(2019, 12, 8, 15, 0),
      "Building the next great ad empire",
      "One of the most prominent names in the advertising industry outlines his big vision for the industry.",
      "Room 103", false,false, [speakers[3], speakers[3]], allThemes),
  new Talk(globals.talkId++,new DateTime(2019, 12, 8, 16, 0), new DateTime(2019, 12, 8, 17, 0),
      "Welcome to the future of mobile robots",
      "A pioneering company at the cutting edge of robotics showcases its vision for the future of robotic technology that interacts with the world.",
      "Room 104", false,false, [speakers[2]], [allThemes[2]]),
  new Talk(globals.talkId++,new DateTime(2019, 12, 10, 9, 0), new DateTime(2019, 12, 10, 10, 0),
      "Predicting the future of brand design",
      "Despite cultural, political and technological change, one thing remains constant: Companies will keep trying to sell you stuff, and they’ll keep coming up with new ways to do it. Let's hear what the experts think of where the industry is going.",
      "Room 105", false,false,[speakers[3]], [allThemes[3]]),
  new Talk(globals.talkId++,new DateTime(2019, 12, 10, 16, 0), new DateTime(2019, 12, 10, 17, 30),
      "Learn to win",
      "DJI presents a ground-breaking educational robot that helps to understand science, programming and more through captivating gameplay modes and intelligent features.",
      "Room 106", true,true, [speakers[0]], [allThemes[3]]),
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
  bool _isVisible = true;

  Icon sheduleIcon = new Icon (Icons.announcement);

  void _onItemTapped(int index) {

    setState(() {
      _selectedIndex = index;
      if(index == 0){
        texto = "Schedule";
        _isVisible = true;
        this.sheduleIcon = new Icon(Icons.calendar_today);
      }
      else if(index == 1){
        texto = "All Talks";
        _isVisible = true;
        this.sheduleIcon = new Icon(Icons.announcement);
      }
      else if (index == 2){
        texto = "Account";
        _isVisible = false;
      }

      _selectedPageIndex = _selectedIndex;
    });
  }

  final List<Widget> _children = [
    MyHomePage(talkList: _talkList),
    MyAllTalksPage(talkList: _talkList),
    MyAccountPage(talkList: _talkList, themesList: allThemes, user: user),
    MySchedulePage(talkList: _talkList),
    MyRecommendedTalks(talkList: _talkList, user: user,),
  ];

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
        child: FloatingActionButton(
            mini: false,
            backgroundColor: Color(0xFF28316C),
            child: sheduleIcon,
            onPressed: () {
              setState((){

                switch(_selectedPageIndex){
                  case 3:
                    this.sheduleIcon = new Icon(Icons.calendar_today);
                    _selectedPageIndex = 0;
                    break;

                  case 0:
                    this.sheduleIcon = new Icon(Icons.format_list_bulleted);
                    _selectedPageIndex = 3;
                    break;

                  case 1:
                    this.sheduleIcon = new Icon(Icons.all_inclusive);
                    texto = "Recommended Talks";
                    _selectedPageIndex = 4;
                    break;

                  case 4:
                    this.sheduleIcon = new Icon(Icons.announcement);
                    texto = "All Talks";
                    _selectedPageIndex = 1;
                    break;
                }
              });
            },
          ),
        ),


      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.yellow,
            icon: Icon(Icons.access_time),
            title: Text(
              'Schedule',
              key: Key("ScheduleButton"),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.content_copy),
              //key: Key("MenuBar"),
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