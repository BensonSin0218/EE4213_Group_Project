import "package:bot_toast/bot_toast.dart";
import "package:ee4213_group_project/data/appInfo.dart";
import "package:ee4213_group_project/SplashScreen/splashScreen.dart";
import "package:flutter/material.dart";

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
        primarySwatch: Colors.pink,
        primaryColor: Colors.pink[300],
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: DayDayCooking(),
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()]
    );
  }
}

class DayDayCooking extends StatefulWidget {
  DayDayCooking({Key key}) : super(key: key);

  @override
  _DayDayCookingState createState() => _DayDayCookingState();
}

class _DayDayCookingState extends State<DayDayCooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(),
    );
  }
}