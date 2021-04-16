import "package:bot_toast/bot_toast.dart";
import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.appTitle}) : super(key: key);

  final String appTitle;

  @override
  _HomeScreenState createState()=> _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    double _topHeight = _size.height * 0.2;
    double _bottomHeight = _size.height * 0.8;

    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            color: Colors.white,
            iconSize: 26.0,
            onPressed: () {}
          ),
          centerTitle: false,
          title: Text(
            widget.appTitle,
            style: TextStyle(
              fontFamily: "Lobster"
            ),
            textAlign: TextAlign.right,
          ),
        ),
        body: Column(
          children: <Widget> [
            Container(
              height: _topHeight,
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: 25.0
              ),
              decoration: BoxDecoration(
                color: Colors.pink[300],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36.0),
                  bottomRight: Radius.circular(36.0)
                )
              ),
              child: Row(
                children: <Widget> [
                  Text(
                    "Hi, User!",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    )
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.account_circle),
                    iconSize: 36.0,
                    color: Colors.white,
                    onPressed: () {
                      // Debug message
                      print("HI");
                    },
                  )
                ],
              ),
            ),
            Column(
              children: <Widget> []
            )
          ]
        )
      )
    );
  }
}