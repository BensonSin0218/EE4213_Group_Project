import 'package:flutter/material.dart';

AppBar detailAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.pink[300],
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_rounded, //return button
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    centerTitle: false,
    // title: Text(
    //   "Back".toUpperCase(),
    //   style: TextStyle(
    //     color: Colors.pink,
    //   ),
    // ),
    actions: [
      IconButton(
        icon: Icon(
          Icons.share_rounded, //share button
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(
          Icons.bookmark_outline_rounded, //more button
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    ],
  );
}
