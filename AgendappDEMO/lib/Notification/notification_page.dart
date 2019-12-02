import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_login_page/Model/Talk.dart';
import 'package:flutter_login_page/Notification/create_notification_page.dart';
import 'package:flutter_login_page/Notification/custom_wide_flat_button.dart';
import 'package:flutter_login_page/Notification/notification_data.dart';
import 'package:flutter_login_page/Notification/notification_plugin.dart';

class NotificationPage extends StatefulWidget {
  final List<Talk> talkList;

  const NotificationPage({Key key, this.talkList}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  final NotificationPlugin _notificationPlugin = NotificationPlugin();
  Future<List<PendingNotificationRequest>> notificationFuture;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    notificationFuture = _notificationPlugin.getScheduleNotifications();
    generateAllNotifications();
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
          CustomWideFlatButton(
            onPressed: navigateToNotificationCreation,
            backgroundColor: Colors.blue.shade300,
            foregroundColor: Colors.blue.shade900,
            isRoundedAtBottom: false,
          )
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
  
  Future<void> navigateToNotificationCreation() async{
    NotificationData notificationData = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CreateNotificationPage(),
      ),
    );
    if(notificationData != null){
      final notificationList = await _notificationPlugin.getScheduleNotifications();
      int id =0; 
      for(var i=0; i< 100; i++){
        bool exists =_notificationPlugin.checkIfIdExists(notificationList,i);
        if(!exists){
          id=i; 
        }
      }
      await _notificationPlugin.showDailyAtTime( //todo change to weekly at time
          notificationData.time,
          id,
          notificationData.title,
          notificationData.description
      );
      refreshNotification();
    }
  }

  //create a notification
  createTalkNotification(Time timeTalk,Day dayTalk,String titleTalk,String descriptionTalk) {
    final title = titleTalk;
    final description = descriptionTalk;
    final time = timeTalk;
    final day = dayTalk; //to be used when i integrate weekly notification
    print(title + ' ' + description);
    print(time);
    print(day);
    final notificationData = NotificationData(title, description,time); //todo change to weekly
    Navigator.of(context).pop(notificationData);
  }

  //generate all talk notifications
  void generateAllNotifications() {
    print(widget.talkList);

    widget.talkList.forEach((element) =>({
      if(element.selected && element.notify)
        createTalkNotification(Time(element.dateInitial.hour, element.dateInitial.minute), Day(element.dateInitial.day), element.name, element.information)
    }));
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
