import 'package:flutter/material.dart';
import 'package:flutter_login_page/Model/ThemeTalk.dart';

Widget displayAllThemes(List<ThemeTalk> themes) {
  return Container(
      height: 76.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: themes.length,
        itemBuilder: (context, index) {
          return displayThemeTalk(themes[index]);
        },
      ));
}

Widget displayThemeTalk(ThemeTalk theme) {
  return Container(
      padding: const EdgeInsets.only(right: 10, left: 0, top: 20, bottom: 20),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 2, color: theme.color),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                  color: Color(0x20000000), blurRadius: 5, offset: Offset(0, 3))
            ]),
        child: Text(theme.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: theme.color,
              shadows: [
                Shadow(
                  blurRadius: 5.0,
                  color: Color(0xFFD8D8D8),
                )
              ],
            )),
      ));
}