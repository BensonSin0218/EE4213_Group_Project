import "package:bot_toast/bot_toast.dart";
import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink[300],
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: EE4213(),
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()]
    );
  }
}

class EE4213 extends StatefulWidget {
  EE4213({Key key}) : super(key: key);

  @override
  _EE4213State createState() => _EE4213State();
}

class _EE4213State extends State<EE4213> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}