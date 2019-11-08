import 'package:flutter/material.dart';
import 'package:flutter_login_page/Model/Talk.dart';

class MySchedulePage extends StatefulWidget {
  final List<Talk> talkList;

  const MySchedulePage({Key key, this.talkList}) : super(key: key);

  @override
  MySchedulePageState createState() => MySchedulePageState();
}

class Day {
  String weekDay;
  int monthDay;

  Day(String weekDay, int monthDay){
    this.weekDay = weekDay;
    this.monthDay = monthDay;
  }

  String getWeekDay(){
    return weekDay;
  }

  int getMonthDay(){
    return monthDay;
  }
}

class MySchedulePageState extends State<MySchedulePage> {

final List<Day> teste = [
  new Day("MON",13), new Day("TUE",14), new Day("WED",15), new Day("THU",16), new Day("FRI",17),
  ];
final List<String> timeInterval = [
  "08:00 AM", "08:30 AM", "09:00 AM", "09:30 AM", "10:00 AM", "10:30 AM", "11:00 AM", "11:30 AM", "12:00 AM", "12:30 AM",
  "01:00 PM", "01:30 PM", "02:00 PM", "02:30 PM", "03:00 PM", "03:30 PM", "04:00 PM", "04:30 PM", "05:00 PM", "05:30 PM", "06:00 PM"
  ];

int firstBlock;
int finalBlock;
int numBlocks;

// Usado para facilitar a colocaçao dos blocos na tabela
void convertToBlocks(String initTime, String finalTime){
  int initTimeHourInt = int.parse(initTime.substring(0,2));
  int initTimeMinutesInt = int.parse(initTime.substring(3,5));
  int finalTimeHourInt = int.parse(finalTime.substring(0,2));
  int finalTimeMinutesInt = int.parse(finalTime.substring(3,5));

  firstBlock = ((initTimeHourInt-8)*2 + (initTimeMinutesInt)/30).round();
  finalBlock = ((finalTimeHourInt-8)*2 + (finalTimeMinutesInt)/30).round();
  numBlocks = finalBlock - firstBlock;
  print(numBlocks);
}

Container placeBlocks(int i){
  return Container(
            color: Colors.red,
            height: MediaQuery.of(context).size.width * 0.055 * 3,
            width: MediaQuery.of(context).size.width,
          );
}

Container displayTime(int i){
  convertToBlocks("09:30", "11:30");
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
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
    height: MediaQuery.of(context).size.width * 0.055,
    width: MediaQuery.of(context).size.width,
  );
}

Container displaySchedule(int i){
  if((i%2) != 0){
    return Container(
      child: Container(
        child: Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  teste[i].getWeekDay(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF444444),
                    fontSize: 20
                  ),
                ),
                Text(
                  teste[i].getMonthDay().toString() + "JAN",
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 13
                  ),
                ),
              ],
            ),
          ],
        ),
        color: Color.fromARGB(255,240,240,240),
        height: MediaQuery.of(context).size.width * (1/(teste.length + 1)),
        width: MediaQuery.of(context).size.width,
      ),
      alignment: Alignment.topLeft,
      color: Color.fromARGB(255,250,250,250),
      width: MediaQuery.of(context).size.width * (1/(teste.length + 1)),
      height: MediaQuery.of(context).size.height,
    );
  }
  else {
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
                      teste[i].getWeekDay(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF444444),
                        fontSize: 20
                      ),
                    ),
                    Text(
                      teste[i].getMonthDay().toString() + "JAN",
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 13
                      ),
                    ),
                  ],
                ),

              ],
            ),
            color: Color.fromARGB(255,250,250,250),
            height: MediaQuery.of(context).size.width * (1/(teste.length + 1)),
            width: MediaQuery.of(context).size.width,
          ),
          if(i==0)
            placeBlocks(i),
          if(i==0)
            placeBlocks(i),
        ],
      ),
      alignment: Alignment.topLeft,
      color: Color.fromARGB(255,240,240,240),
      width: MediaQuery.of(context).size.width * (1/(teste.length + 1)),
      height: MediaQuery.of(context).size.height,
    );
  }
  
}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.width * (0.055 * (timeInterval.length - 2) + 0.1 + 1/(teste.length + 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget> [
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.width * (1/(teste.length + 1 + 1.1)),
                  width: MediaQuery.of(context).size.width,
                ),
                for(int i = 0; i < timeInterval.length; i++)
                  displayTime(i),
              ],
            ),
            alignment: Alignment.topLeft,
            color: Colors.white,
            width: MediaQuery.of(context).size.width * (1/(teste.length + 1)),
            height: MediaQuery.of(context).size.height,
          ),
          for(int i = 0 ; i < teste.length ; i ++)
            displaySchedule(i),
          
        ],
      )
    )
    );
    
  }
}
