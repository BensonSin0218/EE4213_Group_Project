import "package:bot_toast/bot_toast.dart";
import "package:flutter/material.dart";

import 'DetailScreen/detailScreen.dart';
import "SplashScreen/splashScreen.dart";

const String APPTITLE = "Day Day Cooking";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APPTITLE,
      theme: ThemeData(
        primaryColor: Colors.pink[300],
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: DayDayCooking(appTitle: APPTITLE),
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()]
    );
  }
}

class DayDayCooking extends StatefulWidget {
  DayDayCooking({Key key, this.appTitle}) : super(key: key);

  final String appTitle;

  @override
  _DayDayCookingState createState() => _DayDayCookingState();
}

class _DayDayCookingState extends State<DayDayCooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(appTitle: widget.appTitle),
      // body: DetailScreen(),
    );
  }
}