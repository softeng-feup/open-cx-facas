import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'custom_wide_flat_button.dart';
import 'notification_data.dart';

class CreateNotificationPage extends StatefulWidget {

  @override
  _CreateNotificationPageState createState() => _CreateNotificationPageState();
}

class _CreateNotificationPageState extends State<CreateNotificationPage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Form(
                key:_formKey,
              child: Column(
                children: <Widget>[
                  CustomInputField(
                    controller: _titleController,
                    hintText: 'Title',
                    inputType: TextInputType.text,
                    autoFocus: true,
                  ),
                  SizedBox(height: 12),
                  CustomInputField(
                    controller: _descriptionController,
                    hintText: 'Description',
                    inputType: TextInputType.text,
                    autoFocus: true,
                  ),
                  SizedBox(height: 12),
                  FlatButton(
                      onPressed: selectTime,
                      color: Colors.blue,
                      child: Text(selectedTime.format(context))
                    ),
                  ],
                ),
              ),
            ),
          ),
          CustomWideFlatButton(
            onPressed: createNotification,
            backgroundColor: Colors.blue.shade300,
            foregroundColor: Colors.blue.shade900,
          ),
        ],
      ),
    );
  }

  Future<void> selectTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  //* create notification function
  void createNotification() {
      final title = _titleController.text;
      final description = _descriptionController.text;
      final time = Time(selectedTime.hour,selectedTime.minute);

      final notificationData = NotificationData(title, description, time);
      Navigator.of(context).pop(notificationData);
  }

  //* create notification function
  void createTalkNotification(Time timeTalk,Day dayTalk,String titleTalk,String descriptionTalk) { //e so estupido nao poder user os mesmos nomes mas ok...
    final title = titleTalk;
    final description = descriptionTalk;
    final time = timeTalk;
    final day = dayTalk; //to be used when i integrate weekly notification

    final notificationData = NotificationData(title, description, time);
    Navigator.of(context).pop(notificationData);
  }
}

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    Key key,
    @required this.controller,
    @required this.hintText,
    @required this.inputType,
    this.autoFocus,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: autoFocus,
      keyboardType: inputType,
      validator: (value) {
        if (value.isEmpty) {
          return 'Field can not be empty';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.grey.shade300,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(
            const Radius.circular(5),
          ),
        ),
      ),
    );
  }
}
