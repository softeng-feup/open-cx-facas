import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_login_page/Model/Talk.dart';
import 'package:flutter_login_page/Notification/notification_data.dart';
import 'package:flutter_login_page/Notification/notification_plugin.dart';


import 'package:flutter_login_page/Model/Globals.dart' as globals;

class NotificationPage extends StatefulWidget {
  final List<Talk> talkList;

  const NotificationPage({Key key, this.talkList}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  final NotificationPlugin _notificationPlugin = NotificationPlugin();
  Future<List<PendingNotificationRequest>> notificationFuture;

  @override
  void initState(){
    super.initState();
    notificationFuture = _notificationPlugin.getScheduleNotifications();
    if(!globals.generated){
      generateAllNotifications();
      globals.generated=true;
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
  Future<void> createTalkNotification(Time timeTalk,Day dayTalk,String titleTalk,String descriptionTalk) async{

    final title = titleTalk;
    final time = timeTalk;
    final day = dayTalk;
    final description = 'Day: Hour: ';


    final notificationData = new NotificationData(title, description,time,day); //todo change to weekly
    if(notificationData != null){
      print('nulo');
      final notificationList = await _notificationPlugin.getScheduleNotifications();
      int id =0;
      for(var i=0; i< 100; i++){
        bool exists =_notificationPlugin.checkIfIdExists(notificationList,i);
        if(!exists){
          id=i;
        }
      }
      await _notificationPlugin.showWeeklyAtDayTime(
          notificationData.time,
          notificationData.day,
          id,
          notificationData.title,
          notificationData.description
      );
      refreshNotification();
    }

  }

  //generate all talk notifications
  void generateAllNotifications() {
    int i=0;
    widget.talkList.forEach((element) =>({
      if(element.selected && element.notify){
        //element.dateInitial.subtract(new Duration(minutes: 15)) //convert time //esta linguagem e so autista...
        _notificationPlugin.showWeeklyAtDayTime(Time(element.dateInitial.hour, element.dateInitial.minute),Day(element.dateInitial.day),element.id, element.name,
            (weakToString(element.dateInitial.weekday.toString()) +" "+ element.dateInitial.day.toString() + " " +monthToString(element.dateInitial.month.toString())  + " - " + hourToString(element.dateInitial.hour.toString()) + "h" + minToString(element.dateInitial.minute.toString()) ))
      }
      //createTalkNotification(Time(element.dateInitial.hour, element.dateInitial.minute), Day(element.dateInitial.day), element.name, element.information)
    }
    ));
  }
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
