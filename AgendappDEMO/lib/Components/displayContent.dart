
import 'package:flutter/material.dart';
import 'package:flutter_login_page/Model/Talk.dart';

Widget displayContent(Talk talk) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
      child: Container(
        padding: const EdgeInsets.all(14.0),
        height: 110,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 2, color: talk.color),
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
              talk.name,
              style: TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
                maxLines: 2
            ),
            SizedBox(
              height: 12,
            ),
            Text(talk.information,
                overflow: TextOverflow.ellipsis,
            maxLines: 2)
          ],
        ),

      ),
    ),
  );
}