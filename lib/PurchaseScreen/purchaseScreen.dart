import "package:flutter/material.dart";

class PurchaseScreen extends StatefulWidget {
  PurchaseScreen({Key key, this.foodTitle}) : super(key: key);

  final String foodTitle;

  @override
  _PurchaseScreenState createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  DateTime _lastPressedAt;

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
        resizeToAvoidBottomInset: false,
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
            "",
            style: TextStyle(
              fontFamily: "Lobster"
            ),
            textAlign: TextAlign.right,
          ),
        ),
        body: Column(
          children: <Widget> [
            Container(

            )
          ],
        )
      ),
      onWillPop: () async {
        if (_lastPressedAt == null || DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          _lastPressedAt = DateTime.now();
          return false;
        }
        return true;
      }
    );
  }
}