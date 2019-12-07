import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_login_page/Model/Talk.dart';
import 'package:flutter_login_page/Notification/notification_data.dart';
import 'package:flutter_login_page/Notification/notification_plugin.dart';

import 'package:flutter_login_page/Model/Globals.dart' as globals;

class NotificationPage extends StatefulWidget {

  final List<Talk> talkList;
  final Talk talk;

  const NotificationPage({Key key, this.talkList,this.talk}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();

}

class _NotificationPageState extends State<NotificationPage> {

  final NotificationPlugin _notificationPlugin = NotificationPlugin();
  Future<List<PendingNotificationRequest>> notificationFuture;

  NotificationPlugin getNotificationPlugin(){
    return this._notificationPlugin;
  }

  @override
  void initState(){
    super.initState();
    notificationFuture = _notificationPlugin.getScheduleNotifications();

    globals.notificationPluginGlobal = _notificationPlugin;

    if(!globals.generated){
      print('gerei tudo');
      generateAllNotifications();
      globals.generated=true;
    }
    if(widget.talk != null){
      print('criar nova notif');
      createTalkNotification(widget.talk);
    }
    refreshNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Manage Notifications',
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFF28316C),
      ),
      body: Center(
      child: Column(
        children: <Widget>[
          FutureBuilder<List<PendingNotificationRequest>>(
            future: notificationFuture,
            initialData: [],
            builder: (context, snapshot) {
              final notifications = snapshot.data;
              return Expanded(
                child: ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final notification = notifications[index];
                    return NotificationTile(
                      notification: notification,
                      deleteNotification: dismissNotification,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      ),
    );
  }

  //erase notification
  Future<void> dismissNotification(int id)async{
    await _notificationPlugin.cancelNotifications(id);
    widget.talkList.forEach((element)=>{
      if(element.id == id){
        element.notify=false
      }
    });
    refreshNotification();
  }
  //refresh notification list
  void refreshNotification(){
    setState(() {
      notificationFuture = _notificationPlugin.getScheduleNotifications();
    });
  }

  //create a notification
  Future<void> createTalkNotification(Talk talk) async{

    final title = talk.name;
    final description = weakToString(talk.dateInitial.weekday.toString()) + " " +
        talk.dateInitial.day.toString() + " " + monthToString(talk.dateInitial.month.toString()) + " - " +
        hourToString(talk.dateInitial.hour.toString())+ "h" + minToString(talk.dateFinal.minute.toString());
    final oldTime= talk.dateInitial;
    final newTime= talk.dateInitial.subtract(new Duration(minutes: 15));
    final time = Time(newTime.hour,newTime.minute);
    final day= Day(talk.dateInitial.day);

    final notificationData = new NotificationData(title, description,time,day); //todo change to weekly

    //reset time bc idk if the element is passed by reference
    talk.dateInitial = oldTime;

    if(notificationData != null) {
      final notificationList = await _notificationPlugin.getScheduleNotifications();
      int id = talk.id;
      bool exists = _notificationPlugin.checkIfIdExists(notificationList, id);
      if (exists) {
        return "cant create noptification";
      }
    }
    await _notificationPlugin.showWeeklyAtDayTime(
        notificationData.time,
        notificationData.day,
        talk.id,
        notificationData.title,
        notificationData.description
    );
    refreshNotification();
  }

  //generate all talk notifications
  void generateAllNotifications() {
    int i=0;
    widget.talkList.forEach((element) =>({
      if(element.selected && element.notify){
        //todo
        //element.dateInitial.subtract(new Duration(minutes: 15)) //convert time //esta linguagem e so autista...
        _notificationPlugin.showWeeklyAtDayTime(
            Time(element.dateInitial.hour, element.dateInitial.minute), //time
            Day(element.dateInitial.day),element.id,  //day
            element.name, //id
            (weakToString(element.dateInitial.weekday.toString()) +" "+ element.dateInitial.day.toString() + " " +monthToString(element.dateInitial.month.toString())  + " - " + hourToString(element.dateInitial.hour.toString()) + "h" + minToString(element.dateInitial.minute.toString()) ))
      }
    }
    ));
  }

}

class NotificationTile extends StatelessWidget{
  const NotificationTile({
    Key key,
    @required this.notification,
    @required this.deleteNotification,
}): super(key: key);

  final PendingNotificationRequest notification;
  final Function(int id) deleteNotification;

  @override
  Widget build(BuildContext context){
    return Card(
      shape: StadiumBorder(
        side: BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: ListTile(
        title: Text(notification.title),
        subtitle: Text(notification.body),
        trailing: IconButton(
          onPressed: () => deleteNotification(notification.id),
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}

//utils
String hourToString(String hourNum){
  if(hourNum.length == 1)
    return '0'+ hourNum;
  return hourNum;

}

String minToString(String minNum){
  if(minNum.length == 1 )
    return '0'+minNum;
  return minNum;
}

String weakToString(String weakNum){
  switch(weakNum){
    case "1":
      return "Sun";
      break;
    case "2":
      return "Mon";
      break;
    case "3":
      return "Tue";
      break;
    case "4":
      return "Wed";
      break;
    case "5":
      return "Thu";
      break;
    case "6":
      return "Fri";
      break;
    case "7":
      return "Sat";
      break;
  }
  return null;
}

String monthToString(String monthNum){
  switch(monthNum){
    case "1":
      return "Jan";
      break;
    case "2":
      return "Fev";
      break;
    case "3":
      return "Mar";
      break;
    case "4":
      return "Apr";
      break;
    case "5":
      return "May";
      break;
    case "6":
      return "Jun";
      break;
    case "7":
      return "Jul";
      break;
    case "8":
      return "Aug";
      break;
    case "9":
      return "Sep";
      break;
    case "10":
      return "Oct";
      break;
    case "11":
      return "Nov";
      break;
    case "12":
      return "Dec";
      break;
  }
  return null;
}
