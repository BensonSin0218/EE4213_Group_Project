import "package:ee4213_group_project/data/payment/paymentInformation.dart";
import "package:ee4213_group_project/homeScreen/homeScreen.dart";
import "package:ee4213_group_project/loadingScreen/loadingScreen.dart";
import "package:flutter/material.dart";

import "components/orderDetailRow.dart";
import "components/pinkButton.dart";

class OrderedScreen extends StatefulWidget {
  OrderedScreen({Key key, this.paymentMethod, this.address, this.deliveryDate}) : super(key: key);

  final int paymentMethod;
  final String address, deliveryDate;

  @override
  _OrderedScreenState createState() => _OrderedScreenState();
}

class _OrderedScreenState extends State<OrderedScreen> {
  int paymentMethod;
  String address, deliveryDate, year, month, day, hour, minute, second;

  bool processing = true;

  @override
  void initState(){
    super.initState();

    Future.delayed(Duration(seconds: 3), (){
      setState(() => processing = false);
    });

    paymentMethod = widget.paymentMethod;
    address = widget.address;
    deliveryDate = widget.deliveryDate;
    year = DateTime.now().year.toString();
    month = DateTime.now().month.toString();
    day = DateTime.now().day.toString();
    hour = DateTime.now().hour.toString();
    minute = DateTime.now().minute.toString();
    second = DateTime.now().second.toString();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return processing ? LoadingScreen() : Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: size.height,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0
          ),
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 50.0
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: size.height * 0.3
                  ),
                  child: Container(
                    child: Image.asset(
                      "assets/images/orderConfirmed.png",
                      height: size.height * 0.3,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20.0
                ),
                child: Column(
                  children: [
                    Text(
                      "Payment Successful!",
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
                              text: "Thank you! Your order has been placed.\n\nA confirmation email has been sent to your email (",
                              style: Theme.of(context).textTheme.bodyText2.copyWith(
                                fontSize: 18.0,
                                color: Colors.blueGrey[400]
                              )
                            ),
                            TextSpan(
                              text: "user@example.com",
                              style: Theme.of(context).textTheme.bodyText2.copyWith(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink[300]
                              )
                            ),
                            TextSpan(
                              text: ").\n\nYour order will be delivered at\n",
                              style: Theme.of(context).textTheme.bodyText2.copyWith(
                                fontSize: 18.0,
                                color: Colors.blueGrey[400],
                              )
                            ),
                            TextSpan(
                              text: deliveryDate,
                              style: Theme.of(context).textTheme.bodyText2.copyWith(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey[400],
                              )
                            ),
                            TextSpan(
                              text: ".",
                              style: Theme.of(context).textTheme.bodyText2.copyWith(
                                fontSize: 18.0,
                                color: Colors.blueGrey[400],
                              )
                            ),
                          ]
                        )
                      )
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
                            content: paymentName[paymentMethod]
                          ),
                          OrderDetailRow(
                            title: "Cardholder Name",
                            content: "User",
                          ),
                          OrderDetailRow(
                            title: "Address",
                            content: address,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 30.0
                      ),
                      child: PinkButton(
                        size: size,
                        pressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(
                              ),
                            )
                          );
                        },
                        icon: Icons.home_rounded,
                        name: "Return to Home",
                      )
                    )
                  ]
                )
              )
            ]
          )
        )
      )
    );
  }
}