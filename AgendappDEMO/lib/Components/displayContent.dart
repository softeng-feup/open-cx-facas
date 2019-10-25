
import 'package:flutter/material.dart';
import 'package:flutter_login_page/Model/Talk.dart';

Widget displayContent(Talk talk) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
      child: Container(
        padding: const EdgeInsets.all(14.0),
        height: 86,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                  color: Color(0x20000000),
                  blurRadius: 5,
                  offset: Offset(0, 3))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              talk.task,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            Text(talk.desc)
          ],
        ),
      ),
    ),
  );
}