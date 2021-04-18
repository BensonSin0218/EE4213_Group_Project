import "package:flutter/material.dart";

AppBar detailAppBar(BuildContext context, String recipeName, String recipeURL,  bool isBookmarked, Function toggleBookmark, Function share) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.pink[300],
    leading: IconButton(
      splashRadius: 24.0,
      icon: Icon(
        Icons.arrow_back_rounded, //return button
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    actions: [
      IconButton(
        splashRadius: 24.0,
        icon: Icon(
          Icons.share_rounded, //share button
          color: Colors.white,
        ),
        onPressed: () => share(recipeName, recipeURL),
      ),
      IconButton(
        splashRadius: 24.0,
        icon: Icon(
          isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_outline_rounded, //bookmark button
          color: Colors.white,
        ),
        onPressed: () => toggleBookmark(),
      ),
    ],
  );
}
