import "package:flutter/material.dart";

import "../data/appInfo.dart";
import "../DetailScreen/detailScreen.dart";

import "Components/foodCard.dart";

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState()=> _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          brightness: Brightness.light,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.menu),
            iconSize: 26.0,
            color: Colors.white,
            splashRadius: 26.0,
            onPressed: () {
              // Debug message
              print("[INFO] Menu button is pressed!");
            }
          ),
          centerTitle: false,
          title: Text(
            APPTITLE,
            style: TextStyle(
              fontFamily: "Lobster"
            ),
            textAlign: TextAlign.right
          )
        ),
        body: Column(
          children: <Widget> [
            Container(
              height: _topHeight,
              margin: EdgeInsets.only(
                bottom: 20.0
              ),
              child: Stack(
                children: <Widget> [
                  Container(
                    height: _topHeight - 27.0,
                    padding: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      bottom: 25.0
                    ),
                    decoration: BoxDecoration(
                      color: Colors.pink[300],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36.0),
                        bottomRight: Radius.circular(36.0)
                      )
                    ),
                    child: Row(
                      children: <Widget> [
                        Text(
                          "Hi, User!",
                          style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          )
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.account_circle),
                          iconSize: 36.0,
                          color: Colors.white,
                          onPressed: () {
                            // Debug message
                            print("[INFO] User icon is pressed!");
                          }
                        )
                      ]
                    )
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.center,
                      height: 54.0,
                      margin: EdgeInsets.symmetric(
                        horizontal: 20
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(36.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10.0,
                            offset: Offset(0, 5),
                            color: Colors.pink[300].withOpacity(0.25)
                          )
                        ]
                      ),
                      child: Row(
                        children: <Widget> [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search",
                                hintStyle: TextStyle(
                                  color: Colors.pink[300].withOpacity(0.5)
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              onChanged: (value) {
                                // Debug message
                                print("[INFO] value: $value");

                                // Debug message
                                print("[INFO] Search bar is using!");
                              }
                            )
                          ),
                          IconButton(
                            icon: Icon(Icons.search),
                            iconSize: 20,
                            color: Colors.pink[300],
                            splashRadius: 20.0,
                            onPressed: () {
                              // Debug message
                              print("[INFO] Search button is pressed!");
                            }
                          )
                        ]
                      )
                    )
                  )
                ]
              )
            ),
            // Popular Section
            Container(
              height: _bottomHeight - 157,
              child: Column(
                children: <Widget> [
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 10.0
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: <Widget> [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 5
                                ),
                                child: Text(
                                  "Popular Recipes",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                  )
                                )
                              ),
                              Spacer(),
                              TextButton(
                                child: Text(
                                  "More",
                                  style: TextStyle(
                                    color: Colors.white
                                  )
                                ),
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.pink[300],
                                ),
                                onPressed: () {
                                  //Debug message
                                  print("[INFO] Popular more button is pressed!");
                                }
                              )
                            ]
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            child: Row(
                              children: <Widget> [
                                FoodCard(
                                  image: "assets/images/foods/ramen.jpg",
                                  title: "Tonkotsu Ramen Noodle",
                                  country: "Japanese",
                                  tapFunction: () {
                                    // Debug message
                                    print("[INFO] Food Card 1 is pressed!");

                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => DetailScreen()
                                      )
                                    );
                                  }
                                ),
                                FoodCard(
                                  image: "assets/images/foods/400coffee.jpg",
                                  title: "400 Coffee",
                                  country: "Korea",
                                  tapFunction: () {
                                    // Debug message
                                    print("[INFO] Food Card 2 is pressed!");
                                  }
                                ),
                                FoodCard(
                                  image: "assets/images/foods/cheesecake.jpg",
                                  title: "Cheesecake",
                                  country: "Western",
                                  tapFunction: () {
                                    // Debug message
                                    print("[INFO] Food Card 3 is pressed!");
                                  }
                                ),
                                FoodCard(
                                  image: "assets/images/foods/sweetSourPork.jpg",
                                  title: "Sweet Sour Pork",
                                  country: "Hong Kong",
                                  tapFunction: () {
                                    // Debug message
                                    print("[INFO] Food Card 4 is pressed!");
                                  }
                                )
                              ]
                            )
                          )
                        ]
                      )
                    )
                  ),
                  // Latest Section
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 10.0
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: <Widget> [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 5
                                ),
                                child: Text(
                                  "What's New?",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                  )
                                )
                              ),
                              Spacer(),
                              TextButton(
                                child: Text(
                                  "More",
                                  style: TextStyle(
                                    color: Colors.white
                                  )
                                ),
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.pink[300],
                                ),
                                onPressed: () {
                                  print("[INFO] Latest more button is pressed!");
                                }
                              )
                            ]
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            child: Row(
                              children: <Widget> [
                                FoodCard(
                                  image: "assets/images/foods/mangoPudding.jpg",
                                  title: "Mango Pudding",
                                  country: "England",
                                  tapFunction: () {
                                    // Debug message
                                    print("[INFO] Food Card 1 is pressed!");
                                  }
                                ),
                                FoodCard(
                                  image: "assets/images/foods/chickenPot.jpg",
                                  title: "Chicken Pot",
                                  country: "Hong Kong",
                                  tapFunction: () {
                                    // Debug message
                                    print("[INFO] Food Card 2 is pressed!");
                                  }
                                ),
                                FoodCard(
                                  image: "assets/images/foods/pizza.jpg",
                                  title: "Pizza",
                                  country: "Italy",
                                  tapFunction: () {
                                    // Debug message
                                    print("[INFO] Food Card 3 is pressed!");
                                  }
                                ),
                                FoodCard(
                                  image: "assets/images/foods/swissChickenWings.jpg",
                                  title: "Swiss Chicken Wings",
                                  country: "Hong Kong",
                                  tapFunction: () {
                                    // Debug message
                                    print("[INFO] Food Card 4 is pressed!");
                                  }
                                )
                              ]
                            )
                          )
                        ]
                      )
                    )
                  )
                ]
              )
            )
          ]
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