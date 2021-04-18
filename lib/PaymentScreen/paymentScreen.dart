import "package:flutter/material.dart";

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key key, this.foodTitle}) : super(key: key);

  final String foodTitle;

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  DateTime _lastPressedAt;
  String title;

  @override
  void initState() {
    super.initState();

    title = widget.foodTitle;
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    double _topHeight = _size.height * 0.3;
    double _bottomHeight = _size.height * 0.7;

    return WillPopScope(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          brightness: Brightness.dark,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            iconSize: 26.0,
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pop();
            }
          )
        ),
        body: Column(
          children: <Widget> [
            Container(
              height: _topHeight,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget> [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36.0),
                        bottomRight: Radius.circular(36.0)
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: new ColorFilter.mode(
                          Colors.white.withOpacity(0.3),
                          BlendMode.difference
                        ),
                        image: ExactAssetImage(
                          "assets/images/foods/ramen.jpg"
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "$title",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                        fontFamily: "Lobster",
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
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