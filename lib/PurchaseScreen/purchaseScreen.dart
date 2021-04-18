import "package:flutter/material.dart";

import "../Data/Ramen/ramenInformation.dart";
import "../PaymentScreen/paymentScreen.dart";

import "Components/foodItem.dart";

class PurchaseScreen extends StatefulWidget {
  PurchaseScreen({Key key, this.foodTitle, this.serving}) : super(key: key);

  final String foodTitle;
  final int serving;

  @override
  _PurchaseScreenState createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  DateTime _lastPressedAt;
  String title;

  List<int> amounts;

  void addItem(int i) {
    setState(() {
      amounts[i] += 1;
    });

    // Debug message
    print("[INFO] amounts: $amounts");
  }

  void subItem(int i) {
    setState(() {
      if (amounts[i] - 1 >= 0) amounts[i] -= 1;
    });

    // Debug message
    print("[INFO] amounts: $amounts");
  }

  String totalPrice() {
    double _total_price = 0.0;

    for (int i = 0; i < 17; i++)
    _total_price += price[i] * amounts[i];

    return _total_price.toString();
  }

  @override
  void initState() {
    super.initState();

    title = widget.foodTitle;

    amounts = List<int>.filled(17, widget.serving, growable: true);
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
            Container(
              height: _bottomHeight,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0
                      ),
                      child: Text(
                        "Barbecued Pork",
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.double,
                        )
                      ),
                    ),
                    FoodItem(
                      amounts: amounts,
                      itemNumber: 0,
                      position: [0, 1, 2],
                      foodList: barbecuedPork,
                      price: price,
                      addItem: addItem,
                      subItem: subItem
                    ),
                    FoodItem(
                      amounts: amounts,
                      itemNumber: 1,
                      position: [6, 7, 8],
                      foodList: barbecuedPork,
                      price: price,
                      addItem: addItem,
                      subItem: subItem
                    ),
                    FoodItem(
                      amounts: amounts,
                      itemNumber: 2,
                      position: [9, 10, 11],
                      foodList: barbecuedPork,
                      price: price,
                      addItem: addItem,
                      subItem: subItem
                    ),
                    FoodItem(
                      amounts: amounts,
                      itemNumber: 3,
                      position: [12, 13, 14],
                      foodList: barbecuedPork,
                      price: price,
                      addItem: addItem,
                      subItem: subItem
                    ),
                    FoodItem(
                      amounts: amounts,
                      itemNumber: 4,
                      position: [15, 16, 17],
                      foodList: barbecuedPork,
                      price: price,
                      addItem: addItem,
                      subItem: subItem
                    ),
                    FoodItem(
                      amounts: amounts,
                      itemNumber: 5,
                      position: [18, 19, 20],
                      foodList: barbecuedPork,
                      price: price,
                      addItem: addItem,
                      subItem: subItem
                    ),
                    FoodItem(
                      amounts: amounts,
                      itemNumber: 6,
                      position: [21, 22, 23],
                      foodList: barbecuedPork,
                      price: price,
                      addItem: addItem,
                      subItem: subItem
                    ),
                    FoodItem(
                      amounts: amounts,
                      itemNumber: 7,
                      position: [24, 25, 26],
                      foodList: barbecuedPork,
                      price: price,
                      addItem: addItem,
                      subItem: subItem
                    ),
                    FoodItem(
                      amounts: amounts,
                      itemNumber: 8,
                      position: [27, 28, 29],
                      foodList: barbecuedPork,
                      price: price,
                      addItem: addItem,
                      subItem: subItem
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0
                      ),
                      child: Text("Pork Bone Broth",
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.double,
                        )
                      ),
                    ),
                    FoodItem(
                      amounts: amounts,
                      itemNumber: 9,
                      position: [0, 1, 2],
                      foodList: porkBoneBroth,
                      price: price,
                      addItem: addItem,
                      subItem: subItem
                    ),
                    FoodItem(
                      amounts: amounts,
                      itemNumber: 10,
                      position: [3, 4, 5],
                      foodList: porkBoneBroth,
                      price: price,
                      addItem: addItem,
                      subItem: subItem
                    ),
                    FoodItem(
                      amounts: amounts,
                      itemNumber: 11,
                      position: [6, 7, 8],
                      foodList: porkBoneBroth,
                      price: price,
                      addItem: addItem,
                      subItem: subItem
                    ),
                    FoodItem(
                      amounts: amounts,
                      itemNumber: 12,
                      position: [9, 10, 11],
                      foodList: porkBoneBroth,
                      price: price,
                      addItem: addItem,
                      subItem: subItem
                    ),
                    FoodItem(
                      amounts: amounts,
                      itemNumber: 13,
                      position: [12, 13, 14],
                      foodList: porkBoneBroth,
                      price: price,
                      addItem: addItem,
                      subItem: subItem
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text("Ramen",
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.double,
                        )
                      ),
                    ),
                    FoodItem(
                      amounts: amounts,
                      itemNumber: 14,
                      position: [0, 1, 2],
                      foodList: japaneseRamen,
                      price: price,
                      addItem: addItem,
                      subItem: subItem
                    ),
                    FoodItem(
                      amounts: amounts,
                      itemNumber: 15,
                      position: [3, 4, 5],
                      foodList: japaneseRamen,
                      price: price,
                      addItem: addItem,
                      subItem: subItem
                    ),
                    FoodItem(
                      amounts: amounts,
                      itemNumber: 16,
                      position: [6, 7, 8],
                      foodList: japaneseRamen,
                      price: price,
                      addItem: addItem,
                      subItem: subItem
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 10.0,
                        top: 20.0
                      ),
                      child: Row(
                        children: <Widget> [
                          Text(
                            "Shipping Fee",
                            style: Theme.of(context).textTheme.bodyText2.copyWith(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink[400],
                            )
                          ),
                          Spacer(),
                          Text(
                            "Free",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink[400],
                            )
                          ),
                        ]
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
                            "\$ " + totalPrice(),
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
                              Icons.check_circle_rounded,
                              size: 28.0,
                              color: Colors.white,
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
                          primary: totalPrice() == "0.0" ? Colors.blueGrey[200] : Colors.pink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(36.0),
                          )
                        ),
                        onPressed: totalPrice() != "0.0" ? () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PaymentScreen(
                                foodTitle: title,
                              )
                            )
                          );
                        }     //todo: bot toast
                        : () {

                        },
                      )
                    )
                  ],
                ),
              ),
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
