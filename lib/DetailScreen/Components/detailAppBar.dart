import "package:flutter/material.dart";

AppBar detailAppBar(BuildContext context, String recipeName, String recipeURL,  bool isBookmarked, Function toggleBookmark, Function share) {
  var iconButton = IconButton(
          icon: Icon(
            Icons.share_rounded, //share button
            color: Colors.white,
          ),
          onPressed: () => share(recipeName, recipeURL)
        );
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
    actions: [
      Material(
        color: Colors.transparent,
        child: iconButton,
      ),
      Material(
        color: Colors.transparent,
        child: IconButton(
          icon: Icon(
            isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_outline_rounded, //bookmark button
            color: Colors.white,
          ),
          onPressed: () => toggleBookmark(),
        ),
      ),
    ],
  );
}
