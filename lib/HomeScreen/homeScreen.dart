import "package:bot_toast/bot_toast.dart";
import "package:flutter/material.dart";

import "Component/foodCard.dart";

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.appTitle}) : super(key: key);

  final String appTitle;

  @override
  _HomeScreenState createState()=> _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            widget.appTitle,
            style: TextStyle(
              fontFamily: "Lobster"
            ),
            textAlign: TextAlign.right,
          ),
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
                          },
                        )
                      ],
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
                            offset: Offset(0, 10),
                            blurRadius: 50.0,
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
                              onChanged: (value) {},
                            )
                          ),
                          Icon(
                            Icons.search,
                            size: 20,
                            color: Colors.pink[300],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: _bottomHeight - 157,
              child: Column(
                children: <Widget> [
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
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
                                  "Popular",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                  )
                                ),
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
                                  print("[INFO] Popular more button is pressed!");
                                }
                              )
                            ]
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget> [
                                FoodCard(
                                  image: "assets/images/ramen.jpg",
                                  title: "Ramen",
                                  country: "Japanese",
                                  tapFunction: () {
                                    // Debug message
                                    print("[INFO] Food Card 1 is pressed!");
                                  },
                                ),
                                FoodCard(
                                  image: "assets/images/400coffee.jpg",
                                  title: "400 Coffee",
                                  country: "Korea",
                                  tapFunction: () {
                                    // Debug message
                                    print("[INFO] Food Card 2 is pressed!");
                                  },
                                ),
                                FoodCard(
                                  image: "assets/images/cheesecake.jpg",
                                  title: "Cheesecake",
                                  country: "Western",
                                  tapFunction: () {
                                    // Debug message
                                    print("[INFO] Food Card 3 is pressed!");
                                  },
                                ),
                                FoodCard(
                                  image: "assets/images/sweetSourPork.jpg",
                                  title: "Sweet Sour Pork",
                                  country: "Hong Kong",
                                  tapFunction: () {
                                    // Debug message
                                    print("[INFO] Food Card 4 is pressed!");
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    )
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
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
                                  "Latest",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                  )
                                ),
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
                            child: Row(
                              children: <Widget> [
                                FoodCard(
                                  image: "assets/images/ramen.jpg",
                                  title: "Ramen",
                                  country: "Japanese",
                                  tapFunction: () {
                                    // Debug message
                                    print("[INFO] Food Card 1 is pressed!");
                                  },
                                ),
                                FoodCard(
                                  image: "assets/images/400coffee.jpg",
                                  title: "400 Coffee",
                                  country: "Korea",
                                  tapFunction: () {
                                    // Debug message
                                    print("[INFO] Food Card 2 is pressed!");
                                  },
                                ),
                                FoodCard(
                                  image: "assets/images/cheesecake.jpg",
                                  title: "Cheesecake",
                                  country: "Western",
                                  tapFunction: () {
                                    // Debug message
                                    print("[INFO] Food Card 3 is pressed!");
                                  },
                                ),
                                FoodCard(
                                  image: "assets/images/sweetSourPork.jpg",
                                  title: "Sweet Sour Pork",
                                  country: "Hong Kong",
                                  tapFunction: () {
                                    // Debug message
                                    print("[INFO] Food Card 4 is pressed!");
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    )
                  )
                ]
              )
            )
          ],
        )
      )
    );
  }
}