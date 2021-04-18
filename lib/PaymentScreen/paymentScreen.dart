import 'package:ee4213_group_project/HomeScreen/Components/foodCard.dart';
import "package:flutter/material.dart";

class PaymentScreen extends StatefulWidget {
  final String foodTitle;
  final String totalPrice;

  PaymentScreen({Key key, this.foodTitle, this.totalPrice}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  DateTime _lastPressedAt;
  String title;
  bool selectedPaymentMethod = false;

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
                  })),
          body: Column(
            children: <Widget>[
              Container(
                height: _topHeight,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(36.0),
                            bottomRight: Radius.circular(36.0)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.white.withOpacity(0.3),
                              BlendMode.difference),
                          image:
                              ExactAssetImage("assets/images/foods/ramen.jpg"),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "$title",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            fontFamily: "Lobster",
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: _bottomHeight,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                        child: Text(
                          "Choose a Payement Method",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          )
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Row(
                          children: <Widget> [
                            FoodCard(
                              image: "assets/images/payment_methods/visa.png",
                              title: "Visa",
                              country: "None",
                              tapFunction: () {
                                // Debug message
                                print("[INFO] Payment Card 1 is pressed!");
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20.0,
                          bottom: 30.0,
                          right: 10.0
                        ),
                        child: Row(
                          children: <Widget> [
                            Text(
                              "Total",
                              style: Theme.of(context).textTheme.bodyText2.copyWith(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                              )
                            ),
                            Spacer(),
                            Text(
                              "\$ " + widget.totalPrice,
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                              )
                            )
                          ]
                        )
                      ),
                      SizedBox(
                        height: _size.height * 0.07,
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.payment_rounded,
                                size: 28.0,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.0
                              ),
                              Text(
                                "Pay!",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                )
                              )
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: selectedPaymentMethod ? Colors.pink : Colors.blueGrey[200],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36.0),
                            )
                          ),
                          onPressed: selectedPaymentMethod ? () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PaymentScreen(    //todo!
                                  foodTitle: title,
                                  totalPrice: widget.totalPrice,
                                )
                              )
                            );
                          }     //todo: bot toast
                          : () {

                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt) >
                  Duration(seconds: 1)) {
            _lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        });
  }
}
