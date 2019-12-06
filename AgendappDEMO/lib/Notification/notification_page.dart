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
    print(globals.generated);
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
    //final description = descriptionTalk; //it will make a sting with day and hour
    final time = timeTalk;
    final day = dayTalk; //todo to be used when i integrate weekly notification
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
      await _notificationPlugin.showWeeklyAtDayTime( //todo change to weekly at time
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
        //todo convert time
        _notificationPlugin.showWeeklyAtDayTime(Time(element.dateInitial.hour, element.dateInitial.minute),Day(element.dateInitial.day),globals.notificationId++, element.name,
            ("Date: " + element.dateInitial.month.toString() + "/" + element.dateInitial.day.toString() + " Hour: " + element.dateInitial.hour.toString() + ":" + element.dateInitial.minute.toString() ))
      }
      //createTalkNotification(Time(element.dateInitial.hour, element.dateInitial.minute), Day(element.dateInitial.day), element.name, element.information)
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
