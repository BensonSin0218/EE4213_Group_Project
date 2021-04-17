import 'package:flutter/material.dart';
import 'package:share/share.dart';

AppBar detailAppBar(BuildContext context, String recipeName, String recipeURL, void toggleBookmark, bool isBookmarked) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.pink[300],
    leading: Material(
      color: Colors.transparent,
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_rounded, //return button
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
    centerTitle: false,
    // title: Text(
    //   "Back".toUpperCase(),
    //   style: TextStyle(
    //     color: Colors.pink,
    //   ),
    // ),
    actions: [
      Material(
        color: Colors.transparent,
        child: IconButton(
          icon: Icon(
            Icons.share_rounded, //share button
            color: Colors.white,
          ),
          onPressed: () =>
              Share.share("Check out the Recipe: \n$recipeName\n$recipeURL", subject: "Check out the Recipe: $recipeName"),
        ),
      ),
      Material(
        color: Colors.transparent,
        child: IconButton(
          icon: Icon(
            isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_outline_rounded, //bookmark button
            color: Colors.white,
          ),
          onPressed: () => toggleBookmark,
        ),
      ),
    ],
  );
}
