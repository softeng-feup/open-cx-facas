import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_login_page/Notification/create_notification_page.dart';
import 'package:flutter_login_page/Notification/custom_wide_flat_button.dart';
import 'package:flutter_login_page/Notification/notification_data.dart';
import 'package:flutter_login_page/Notification/notification_plugin.dart';

class NotificationPage extends StatefulWidget {
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
