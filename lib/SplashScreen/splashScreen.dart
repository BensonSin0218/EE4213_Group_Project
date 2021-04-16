import "package:flutter/material.dart";

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
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
                    "Day Day Cooking",
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