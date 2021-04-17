import "package:flutter/material.dart";

import "../HomeScreen/homeScreen.dart";

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, this.appTitle}) : super(key: key);

  final String appTitle;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(appTitle: widget.appTitle)
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget> [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.pink[300]
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget> [
                  Image.asset(
                    "assets/images/cooking_icon.png",
                    height: 250.0,
                    width: 250.0
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    widget.appTitle,
                    style: Theme.of(context).textTheme.headline4.copyWith(
                      fontFamily: "Lobster",
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  )
                ]
              )
            )
          ]
        ),
      )
    );
  }
}