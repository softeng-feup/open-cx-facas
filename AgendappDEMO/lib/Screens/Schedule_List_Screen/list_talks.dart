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

    List<DateTime> myDates = new List();

    for(int i = 0; i < widget.talkList.length; i++){

      if(!hasDateMatch(widget.talkList[i].dateInitial, myDates)){

        myDates.add(widget.talkList[i].dateInitial);

        String newDate = new DateFormat("dd MM").format(widget.talkList[i].dateInitial);
        myTabs.add(Tab(text: newDate));
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

    List<Talk> selectedTalks = new List<Talk>();

    for(Talk talk in widget.talkList){
      if(talk.selected)
        selectedTalks.add(talk);
    }

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

          var listOfDay = selectedTalks.where((talk) => (talk.dateInitial.day == int.parse(tab.text.substring(0, 2)) && talk.dateInitial.month == int.parse(tab.text.substring(3, 5)) ));

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
                    displayContent(listOfDay.elementAt(index))
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
          });
        },
      ),
    );
  }
}
