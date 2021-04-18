import "package:bot_toast/bot_toast.dart";
import "package:flutter/material.dart";

import "components/paymentCard.dart";

import "../data/payment/paymentInformation.dart";
import "../orderedScreen/orderedScreen.dart";

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key key, this.foodTitle, this.totalPrice}) : super(key: key);

  final String foodTitle, totalPrice;

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int paymentMethod;
  String title, totalPrice, userAddress, deliveryDate;
  List<bool> selected;

  @override
  void initState() {
    super.initState();

    paymentMethod = 0;
    title = widget.foodTitle;
    totalPrice = widget.totalPrice;
    userAddress = "Room D, 30/F, ABC Building, 1 ABC Street, KLT, Kowloon, Hong Kong";
    deliveryDate = "";
    selected = List<bool>.filled(5, false, growable: true);

    // Set first payment method as default
    selected[paymentMethod] = true;
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    double _topHeight = _size.height * 0.3;
    double _bottomHeight = _size.height * 0.7;

    return Scaffold(
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
                      bottomRight: Radius.circular(36.0)
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.3),
                        BlendMode.difference
                      ),
                      image: ExactAssetImage("assets/images/foods/ramen.jpg"),
                    )
                  )
                ),
                Center(
                  child: Text(
                    "$title",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                      fontFamily: "Lobster",
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    )
                  )
                )
              ]
            )
          ),
          Container(
            height: _bottomHeight,
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Container(
                  child: Column(
                    children: <Widget> [
                      Row(
                        children: <Widget> [
                          Text(
                            "Payment Method",
                            style: Theme.of(context).textTheme.bodyText2.copyWith(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink,
                              decoration: TextDecoration.underline,
                            )
                          )
                        ]
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Row(
                          children: <Widget> [
                            for(int i = 0; i < 5; i++)
                              PaymentCard(
                                position: i,
                                title: paymentName[i],
                                image: paymentImage[i],
                                selected: selected,
                                tapFunction: selectPayment,
                              )
                          ]
                        )
                      )
                    ]
                  )
                ),
                SizedBox(
                  height: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Text(
                      "Address",
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                        decoration: TextDecoration.underline,
                      ),
                      textAlign: TextAlign.left
                    ),
                    SizedBox(
                      height: 10.0
                    ),
                    Text(
                      userAddress,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black
                      )
                    )
                  ]
                ),
                SizedBox(
                  height: 10.0
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Text(
                      "Delivery date",
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                        decoration: TextDecoration.underline,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget> [
                        Text(
                          "Date: " + (deliveryDate == "" ? "Pick a delivery date!" : deliveryDate),
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black
                          )
                        ),
                        Spacer(),
                        ElevatedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.date_range_rounded,
                                size: 15.0,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                "Change Date",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                )
                              )
                            ]
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.pink,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36.0)
                            )
                          ),
                          onPressed: () {
                            // Debug message
                            print("[INFO] Change datae button is pressed!");

                            showDatePicker(
                              context: context,
                              builder: (BuildContext context, Widget child) {
                                return Theme(
                                  data: ThemeData.light().copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary: Colors.pink[300],
                                    ),
                                  ),
                                  child: child
                                );
                              },
                              initialDate: DateTime.utc(2021, 4, 27),
                              firstDate: DateTime(2001),
                              lastDate: DateTime(2222)
                            ).then((date) {
                              // Debug message
                              print("[INFO] date: $date");

                              setState(() {
                                deliveryDate = "${date.year} / ${date.month} / ${date.day}";
                              });
                            });

                            // Debug message
                            print("[INFO] deliveryDate: $deliveryDate");
                          }
                        )
                      ]
                    )
                  ]
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget> [
                    Text(
                      "Total",
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink
                      )
                    ),
                    Spacer(),
                    Text(
                      "\$ $totalPrice",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink
                      )
                    )
                  ]
                ),
                SizedBox(
                  height: 20.0
                ),
                SizedBox(
                  height: _size.height * 0.07,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.check_circle_rounded,
                          size: 28.0,
                          color: Colors.white
                        ),
                        SizedBox(
                          width: 10.0
                        ),
                        Text(
                          "Confirm!",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          )
                        )
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: deliveryDate != "" ? Colors.pink : Colors.blueGrey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.0)
                      )
                    ),
                    onPressed: deliveryDate != "" ? () {
                      // Debug message
                      print("[INFO] Pay button is pressed!");

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => OrderedScreen(
                            paymentMethod: paymentMethod,
                            address: userAddress,
                            deliveryDate: deliveryDate,
                          )
                        )
                      );
                    }
                    : () {
                      // Debug message
                      print("[INFO] Pay button is pressed!");

                      BotToast.showNotification(
                        title: (_) => Text(
                          "Pick a delivery date!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red
                          )
                        )
                      );
                    }
                  )
                )
              ]
            )
          )
        ]
      )
    );
  }

  void selectPayment(int position) {
    // Debug message
    print("[INFO] Select payment $position card is pressed");

    for(int i = 0; i < 5; i++)
      selected[i] = false;

    setState(() {
      selected[position] = true;
    });

    paymentMethod = position;

    // Debug message
    print("[INFO] selected: $selected");
    print("[INFO] paymentMethod: $paymentMethod");
  }
}
