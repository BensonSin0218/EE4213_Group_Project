import "package:flutter/material.dart";

import "components/orderDetailRow.dart";
import "components/pinkButton.dart";

import "../homeScreen/homeScreen.dart";
import "../loadingScreen/loadingScreen.dart";
class OrderedScreen extends StatefulWidget {
  @override
  _OrderedScreenState createState() => _OrderedScreenState();
}

class _OrderedScreenState extends State<OrderedScreen> {
  String appTitle = "Day Day Cooking";
  String year = DateTime.now().year.toString();
  String month = DateTime.now().month.toString();
  String day = DateTime.now().day.toString();
  String hour = DateTime.now().hour.toString();
  String minute = DateTime.now().minute.toString();
  String second = DateTime.now().second.toString();

  bool processing = true;

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      setState(() => processing = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return processing ? LoadingScreen() : Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: size.height,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: size.height * 0.3),
                    child: Container(
                      child: Image.asset(
                        "assets/images/orderConfirmed.png",
                        height: size.height * 0.3,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      Text(
                        "Payment Successful",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Thank you! Your order has been placed.\nA confirmation email has been sent to your email (",
                                style: Theme.of(context).textTheme.bodyText2.copyWith(
                                  fontSize: 18.0,
                                  color: Colors.blueGrey[400],
                                ),
                              ),
                              TextSpan(
                                text: "user@example.com",
                                style: Theme.of(context).textTheme.bodyText2.copyWith(
                                  fontSize: 18.0,
                                  color: Colors.pink[300],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ").\n\nYour order will be delivered within the next 3 - 7 days.",
                                style: Theme.of(context).textTheme.bodyText2.copyWith(
                                  fontSize: 18.0,
                                  color: Colors.blueGrey[400],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          children: [
                            OrderDetailRow(
                              title: "Order Ref.",
                              content: "848590",
                            ),
                            OrderDetailRow(
                              title: "Order Date",
                              content: year + "-" + month + "-" + day + "\t\t\t" + hour + ":" + minute + ":" + second,
                            ),
                            OrderDetailRow(
                              title: "Payment Type",
                              content: "Visa",
                            ),
                            OrderDetailRow(
                              title: "Cardholder Name",
                              content: "User",
                            ),
                            OrderDetailRow(
                              title: "Address",
                              content: "ABC Tower",
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: PinkButton(
                          size: size,
                          pressed: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(appTitle: appTitle),
                              )
                            );
                          },
                          icon: Icons.home_rounded,
                          name: "Return to Home",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}