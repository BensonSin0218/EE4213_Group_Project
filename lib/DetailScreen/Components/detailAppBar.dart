import "package:flutter/material.dart";

AppBar detailAppBar(BuildContext context, String recipeName, String recipeURL,  bool isBookmarked, Function toggleBookmark, Function share) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.pink[300],
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_rounded, //return button
        color: Colors.white,
      ),
      splashRadius: 24.0,
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    actions: [
      IconButton(
        icon: Icon(
          Icons.share_rounded, //share button
          color: Colors.white,
        ),
        splashRadius: 24.0,
        onPressed: () => share(recipeName, recipeURL),
      ),
      IconButton(
        icon: Icon(
          isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_outline_rounded, //bookmark button
          color: Colors.white,
        ),
        splashRadius: 24.0,
        onPressed: () => toggleBookmark(),
      ),
    ],
  );
}
