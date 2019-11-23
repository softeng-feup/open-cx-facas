import 'package:flutter/material.dart';
import 'package:flutter_login_page/Model/Talk.dart';
import 'package:flutter_login_page/Screens/Talk%20Screen/talkScreen.dart';

class MySchedulePage extends StatefulWidget {
  final List<Talk> talkList;

  const MySchedulePage({Key key, this.talkList}) : super(key: key);

  @override
  MySchedulePageState createState() => MySchedulePageState();
}

class MySchedulePageState extends State<MySchedulePage>   {

  int firstBlock = 0;
  int finalBlock = 0;
  int numBlocks = 0;
  double blockSize = 0.04;
  ScrollController _controller1;
  ScrollController _controller2;

  List<DateTime> daysList = [new DateTime(2019, 12, 8, 8, 0), new DateTime(2019, 12, 9, 8, 0),new DateTime(2019, 12, 10, 8, 0),new DateTime(2019, 12, 11, 8, 0),new DateTime(2019, 12, 12, 8, 0),new DateTime(2019, 12, 13, 8, 0)];
  List<ScrollController> controllers = new List<ScrollController>();

  final List<String> timeInterval = [
    "08:00 AM", "08:30 AM", "09:00 AM", "09:30 AM", "10:00 AM", "10:30 AM", "11:00 AM", "11:30 AM", "12:00 AM", "12:30 AM",
    "01:00 PM", "01:30 PM", "02:00 PM", "02:30 PM", "03:00 PM", "03:30 PM", "04:00 PM", "04:30 PM", "05:00 PM", "05:30 PM", "06:00 PM"
  ];

  @override
  void initState() {

    super.initState();
    createControllers();
    _controller1 = ScrollController();
    _controller1.addListener(listener1);
    _controller2 = ScrollController();
    _controller2.addListener(listener2);
  }

  void listener1() {
    for(int i = 0; i < controllers.length; i++){
      controllers[i].jumpTo(_controller1.offset);
    }
  }

  void listener2() {
    _controller1.jumpTo(_controller2.offset);
  }

  void createControllers() {
    for(int i = 0; i < daysList.length; i++){
      controllers.add(new ScrollController());
      controllers[i].addListener(listener1);
    }
  }

  

  String convertWeekDay(int day){
    switch (day) {
      case 1:
        return "MON";
        break;
      case 2:
        return "TUE";
        break;
      case 3:
        return "WED";
        break;
      case 4:
        return "THU";
        break;
      case 5:
        return "FRI";
        break;
      case 6:
        return "SUN";
        break;
      case 7:
        return "SAT";
        break;
      default:
        return "nada";
    }
  }

  String convertMonth(int month){
    switch (month) {
      case 1:
        return "JAN";
        break;
      case 2:
        return "FEB";
        break;
      case 3:
        return "MAR";
        break;
      case 4:
        return "APR";
        break;
      case 5:
        return "MAY";
        break;
      case 6:
        return "JUN";
        break;
      case 7:
        return "JUL";
        break;
      case 8:
        return "AUG";
        break;
      case 9:
        return "SET";
        break;
      case 10:
        return "OCT";
        break;
      case 11:
        return "NOV";
        break;
      case 12:
        return "DEC";
        break;
      default:
        return "nada";
    }
  }

// Usado para facilitar a colocaçao dos blocos na tabela
  void convertToBlocks(DateTime initTime, DateTime finalTime){

    firstBlock = ((initTime.hour-8)*2 + (initTime.minute)/30).round();
    finalBlock = ((finalTime.hour-8)*2 + (finalTime.minute)/30).round();
    numBlocks = finalBlock - firstBlock;
  }

  Container placeBlocks(int i, int j, Color backColor, Color blockColor){
    int finalBlockBefore = finalBlock;
    convertToBlocks(widget.talkList[j].dateInitial, widget.talkList[j].dateFinal);
    return Container(
        child: Column(
          children: <Widget>[
            Container(
              color: backColor.withOpacity(0),
              height: MediaQuery.of(context).size.height * blockSize * (firstBlock-finalBlockBefore),                              
              width: MediaQuery.of(context).size.width,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return new TalkScreen(talk: widget.talkList[j]);
                }));
              },
              child: Container(
                color: widget.talkList[j].getColor().withOpacity(0.5),
                height: MediaQuery.of(context).size.height * blockSize * numBlocks,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                      child: Text(
                        widget.talkList[j].name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 12
                        ),
                        overflow: TextOverflow.ellipsis,
                          maxLines: numBlocks,
                    ),
                  ),
                ),
              ),
            )
          ],
        )
    );
  }

  Container displayTime(int i){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            timeInterval[i],
            style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 10
            ),
          ),
        ],
      ),
      color: Colors.white,
      height: MediaQuery.of(context).size.height * blockSize,
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget displaySchedule(int i){
    Color color1;
    Color color2;

    if((i%2) != 0){
      color1= Color.fromARGB(255,240,240,240);
      color2= Color.fromARGB(255,250,250,250);
    }
    else{
      color2= Color.fromARGB(255,240,240,240);
      color1= Color.fromARGB(255,250,250,250);
    }
    finalBlock=0;

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      convertWeekDay(daysList[i].weekday),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF444444),
                          fontSize: 20
                      ),
                    ),
                    Text(
                      daysList[i].day.toString() + convertMonth(daysList[i].month),
                      style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 13
                      ),
                    ),
                  ],
                ),
              ],
            ),
            color: color1,
            height: MediaQuery.of(context).size.height * 2*blockSize,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            color: color2,
            child: ListView(
              scrollDirection: Axis.vertical,
              controller: controllers[i],
              children: <Widget>[
                for(int j = 0; j < widget.talkList.length; j++)
                  if(daysList[i].day == widget.talkList[j].dateInitial.day && widget.talkList[j].selected)
                    placeBlocks(i, j, color2, Color.fromARGB(255,247,220,222)),
                Container(
                  color: Colors.black.withOpacity(0),
                  height:MediaQuery.of(context).size.height * blockSize * (21-finalBlock),
                ),
              ],
            ),
          ),
        ],
      ),
      
      alignment: Alignment.topLeft,
      color: color2,
      width: (MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width * 0.15)) * 0.3333,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
            height: MediaQuery.of(context).size.height * 0.92,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget> [
                      Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 2*blockSize,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.7,
                        color: Colors.white,
                        child: ListView(
                          controller: _controller1,
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            for(int i = 0; i < timeInterval.length; i++)
                            displayTime(i),
                          ],
                        ),
                      ),
                    ],
                  ),
                  alignment: Alignment.topLeft,
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * (1- 0.15),
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: <Widget>[
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          for(int i = 0 ; i < daysList.length ; i ++)
                           displaySchedule(i),
                        ],
                      ),
                     Container(
                       child: ListView(
                        controller: _controller2,
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                           Container(
                             color: Colors.blue.withOpacity(0),
                             width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * blockSize * 21,
                           ),
                        ],
                      ),
                        margin: EdgeInsets.fromLTRB(0, 55, 0, 0),
                        color: Colors.black.withOpacity(0),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                      ),
                    ],
                  ),
                  
                ),
                
              ],
              
            )
            
        );

  }
}