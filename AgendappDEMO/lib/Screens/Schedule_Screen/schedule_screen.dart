import 'package:flutter/material.dart';
import 'package:flutter_login_page/Model/Talk.dart';
import 'package:intl/intl.dart';

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

  ScrollController controller = new ScrollController();
  ScrollController controllerBlocks = new ScrollController();

  List<DateTime> daysList = new List<DateTime>();
  List<String> timeInterval = new List<String>();
  double lastOffSet = 0;

  void listener(){
    controllerBlocks.jumpTo(controller.offset);
  }

  List<DateTime> createDays(List<Talk> talks){

    List<DateTime> dates = new List<DateTime>();

    for(int i = 0; i < talks.length; i++)
    {

      DateTime newDate = DateTime(talks[i].dateInitial.year, talks[i].dateInitial.month, talks[i].dateInitial.day);

      if (!dates.contains(newDate))
      {
        dates.add(newDate);
      }
    }

    return dates;
  }

  List<String> createIntervals(int firstHour, int firstMinutes, int lastHour, int lastMinutes) {
    String firstTime = firstHour.toString().padLeft(2,'0')  + ":" + firstMinutes.toString().padLeft(2,'0') ;
    String lastTime = lastHour.toString().padLeft(2,'0')  + ":" + lastMinutes.toString().padLeft(2,'0') ;
    int differenceHours = lastHour-firstHour;
    int differenceBlocks = differenceHours * 2;
    List<String> finalList = new List();
    int currentHour = firstHour;
    int currentMinutes = firstMinutes;
    finalList.add(firstTime);


    if(firstMinutes != 0)
      differenceBlocks -= 1;

    if(lastMinutes != 0)
      differenceBlocks += 1;

    for(int i = 1; i < differenceBlocks; i ++) {
      currentMinutes += 30;
      if(currentMinutes == 60){
        currentHour ++;
        currentMinutes = 0;
      }

      finalList.add(currentHour.toString().padLeft(2,'0') + ":" + currentMinutes.toString().padRight(2,'0'));
    }
    finalList.add(lastTime);

    return finalList;
  }

  @override
  void initState() {

    daysList = createDays(widget.talkList);
    timeInterval = createIntervals(8, 0, 18, 0);
    controller.addListener(listener);
    super.initState();


  }

// Usado para facilitar a colocaçao dos blocos na tabela
  void convertToBlocks(DateTime initTime, DateTime finalTime){
    firstBlock = ((initTime.hour-8)*2 + (initTime.minute)/30).round();
    finalBlock = ((finalTime.hour-8)*2 + (finalTime.minute)/30).round();
    numBlocks = finalBlock - firstBlock;
  }

  Widget individualTalkBlock(int i, int j, Color backColor, Color blockColor){
    int finalBlockBefore = finalBlock;
    convertToBlocks(widget.talkList[j].dateInitial, widget.talkList[j].dateFinal);
    return Column(
          children: <Widget>[
            Container(
              color: null,
              height: MediaQuery.of(context).size.height * blockSize * (firstBlock-finalBlockBefore),
              width: MediaQuery.of(context).size.width,
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                print("AQUI");
                /*Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return new TalkScreen(talk: widget.talkList[j]);
                }));*/
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
        );
  }

  Widget individualTimeBlock(int i){
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

  Widget dayHeaderContainer(int i, Color color) {
    return Container(
     child: ListView(
       scrollDirection: Axis.vertical,
        controller: controller,
        children: <Widget>[
        Row (
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                DateFormat('EE').format(daysList[i]),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF444444),
                    fontSize: 20
                ),
              ),
              Text(
                DateFormat('dMMM').format(daysList[i]),
                style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 13
                ),
              ),
            ],
          ),
        ],
      )]),
      color: color,
      height: MediaQuery.of(context).size.height * 2*blockSize,
    );
  }

  Widget blockContainer(int i, Color color) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.84,
      color: color,
      child: ListView(
        controller: controllerBlocks,
        children: <Widget>[
          for(int j = 0; j < widget.talkList.length; j++)
            if(daysList[i].day == widget.talkList[j].dateInitial.day && widget.talkList[j].selected)
              individualTalkBlock(i, j, color, Color.fromARGB(255,247,220,222)),

        ],
      ),
    );
  }

  Widget timeContainer() {
    return Container(
      child: Column(
        children: <Widget> [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 2*blockSize,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                for(int i = 0; i < timeInterval.length; i++)
                individualTimeBlock(i),
              ],
            ),
          ),
        ],
      ),
      alignment: Alignment.topLeft,
      color: Colors.white,
      width: MediaQuery.of(context).size.width * 0.15,
      height: MediaQuery.of(context).size.height,
    );
  }

  Widget daysContainer() {
    return SingleChildScrollView(
    child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        timeContainer(),
        Flexible(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                for(int i = 0 ; i < daysList.length ; i ++)
                  dayContainer(i),
              ],
            ),
          ),
        )
      ],
    ),
    );
  }

  Widget dayContainer(int i){
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
          dayHeaderContainer(i, color1),
          blockContainer(i, color2),
        ],
      ),
      alignment: Alignment.topLeft,
      color: color2,
      width: (MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width * 0.15)) * 0.3333,
    );
  }

  @override
  Widget build(BuildContext context) {
    return daysContainer();
  }
}