import 'package:flutter/material.dart';
import 'package:flutter_login_page/Components/displayTime.dart';
import 'package:flutter_login_page/Model/Talk.dart';
import 'package:flutter_login_page/Components/displayContent.dart';
import 'package:intl/intl.dart';


class TalkPage extends StatefulWidget {
  final List<Talk> talkList;

  const TalkPage({Key key, this.talkList}): super(key: key);

  @override
  _TalkPageState createState() => _TalkPageState();
}

class _TalkPageState extends State<TalkPage> with TickerProviderStateMixin {

  List<Tab> myTabs = <Tab>[];
  Map<String, List<Talk>> myTalksPerDay = new Map();

  TabController _tabController;


  bool hasDateMatch(DateTime dateToLookFor, List<DateTime> myDates){

    if(myDates == null)
      return false;

    DateTime result = myDates.firstWhere((o) => (o.day == dateToLookFor.day && o.month == dateToLookFor.month && o.year == dateToLookFor.year), orElse: () => null);

    return result != null;
  }

  @override
  void initState() {
    super.initState();

    List<Talk> selectedTalks = new List<Talk>();

    for(Talk talk in widget.talkList){
      if(talk.selected)
        selectedTalks.add(talk);
    }

    List<DateTime> myDates = new List();

    for(int i = 0; i < selectedTalks.length; i++){

      if(!hasDateMatch(selectedTalks[i].dateInitial, myDates)){

        myDates.add(selectedTalks[i].dateInitial);

        String newDate = new DateFormat("dd MMM").format(selectedTalks[i].dateInitial);
        myTabs.add(Tab(text: newDate));


        var listOfTalks = selectedTalks.where((talk) => (talk.dateInitial.day == selectedTalks[i].dateInitial.day && talk.dateInitial.month == selectedTalks[i].dateInitial.month ));
        myTalksPerDay[newDate] = listOfTalks.toList();
      }

    }

    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = 20;

    return Scaffold(
      appBar: TabBar(
        indicatorColor: Color(0xFF28316C),
        labelColor: Color(0xFF28316C),
        controller: _tabController,
        tabs: myTabs,
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {

          List<Talk> listOfDay = myTalksPerDay[tab.text];

          return ListView.builder(
            itemCount: listOfDay.length,
            padding: const EdgeInsets.all(0),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24),
                child: Row(
                  children: <Widget>[
                    displayTime(
                        new DateFormat("HH:mm").format(listOfDay.elementAt(index).dateInitial),
                        new DateFormat("HH:mm").format(listOfDay.elementAt(index).dateFinal)),
                    lineStyle(
                        context, iconSize, listOfDay.length,
                        listOfDay.elementAt(index)),
                    displayContent(listOfDay.elementAt(index), context)
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget lineStyle(
      BuildContext context, double iconSize, int listLength, Talk talk) {
    return Container(
      padding: const EdgeInsets.only(right: 10.0),
      child: new Checkbox(
        value: talk.selected,
        activeColor: new Color(0xFF283593),
        onChanged: (val) {
          setState(() {
            talk.selected = val;
            talk.notify = val;
            //NotificationPage(talkList: widget.talkList,talk: talk); //todo n funciona!!!
          });
        },
      ),
    );
  }
}

