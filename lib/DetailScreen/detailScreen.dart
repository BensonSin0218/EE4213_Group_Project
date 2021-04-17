import "package:flutter/material.dart";
import "package:youtube_player_flutter/youtube_player_flutter.dart";

import "Components/detailAppBar.dart";
import "Components/detailRow.dart";

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _person = 1;
  String ramenURL = "https://www.youtube.com/watch?v=8j2lmsyy1VE";
  List<dynamic> barbecuedPork = [
    "Pork Shoulder Blade",
    "600",
    " g",
    "Salad Oil",
    "",
    " appropriate amount",
    "Ginger",
    "3",
    " slices",
    "Scallion",
    "1",
    "",
    "Garlic",
    "5",
    " cloves",
    "Mirin",
    "50",
    " ml",
    "Rice Wine",
    "50",
    " ml",
    "Sugar",
    "1",
    " spoon",
    "Soy Sauce",
    "100",
    " ml",
    "Water",
    "600",
    " ml",
  ];

  List<dynamic> porkBoneBroth = [
    "Stock",
    "1",
    " bowl",
    "White Sesame",
    "2",
    " tbsp",
    "Garlic",
    "2",
    " cloves",
    "Milk",
    "50",
    " cc",
    "Miso",
    "1",
    " tsp",
  ];

  List<dynamic> japaneseRamen = [
    "Ramen",
    "1",
    " pack",
    "Soft Boiled Egg",
    "0.5",
    "",
    "Sea Sedge",
    "2",
    "",
    "Corn",
    "",
    " appropriate amount",
  ];

  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(ramenURL),
      flags: YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  void deactivate() {
    _controller.pause(); //pause when going to the next page
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
      ),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: Colors.pink[300],
          appBar: detailAppBar(context),
          body: SafeArea(
            child: Column(
              children: [
                //recipe name
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      "Tonkotsu Ramen Noodle",
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            fontFamily: "Lobster",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
                //content
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 70.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          //video
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            child: player,
                          ),

                          //ingredients
                          Expanded(
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16.0),
                                        child: Text(
                                          "- Ingredients -",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.pink,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 8.0),
                                      child: Text(
                                        "Barbecued Pork",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            .copyWith(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.pink,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationStyle:
                                                  TextDecorationStyle.double,
                                            ),
                                      ),
                                    ),
                                    DetailRow(
                                      name: barbecuedPork[0],
                                      amount: double.parse(barbecuedPork[1]) * _person,
                                      unit: barbecuedPork[2],
                                    ),
                                    DetailRow(
                                      name: barbecuedPork[3],
                                      amount: 0.0,
                                      unit: barbecuedPork[5],
                                    ),
                                    DetailRow(
                                      name: barbecuedPork[6],
                                      amount: double.parse(barbecuedPork[7]) * _person,
                                      unit: barbecuedPork[8],
                                    ),
                                    DetailRow(
                                      name: barbecuedPork[9],
                                      amount: double.parse(barbecuedPork[10]) * _person,
                                      unit: barbecuedPork[11],
                                    ),
                                    DetailRow(
                                      name: barbecuedPork[12],
                                      amount: double.parse(barbecuedPork[13]) * _person,
                                      unit: barbecuedPork[14],
                                    ),
                                    DetailRow(
                                      name: barbecuedPork[15],
                                      amount: double.parse(barbecuedPork[16]) * _person,
                                      unit: barbecuedPork[17],
                                    ),
                                    DetailRow(
                                      name: barbecuedPork[18],
                                      amount: double.parse(barbecuedPork[19]) * _person,
                                      unit: barbecuedPork[20],
                                    ),
                                    DetailRow(
                                      name: barbecuedPork[21],
                                      amount: double.parse(barbecuedPork[22]) * _person,
                                      unit: barbecuedPork[23],
                                    ),
                                    DetailRow(
                                      name: barbecuedPork[24],
                                      amount: double.parse(barbecuedPork[25]) * _person,
                                      unit: barbecuedPork[26],
                                    ),
                                    DetailRow(
                                      name: barbecuedPork[27],
                                      amount: double.parse(barbecuedPork[28]) * _person,
                                      unit: barbecuedPork[29],
                                    ),

                                    SizedBox(height: 8.0),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 8.0),
                                      child: Text(
                                        "Pork Bone Broth",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            .copyWith(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.pink,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationStyle:
                                                  TextDecorationStyle.double,
                                            ),
                                      ),
                                    ),
                                    DetailRow(
                                      name: porkBoneBroth[0],
                                      amount: double.parse(porkBoneBroth[1]) * _person,
                                      unit: porkBoneBroth[2],
                                    ),
                                    DetailRow(
                                      name: porkBoneBroth[3],
                                      amount: double.parse(porkBoneBroth[4]) * _person,
                                      unit: porkBoneBroth[5],
                                    ),
                                    DetailRow(
                                      name: porkBoneBroth[6],
                                      amount: double.parse(porkBoneBroth[7]) * _person,
                                      unit: porkBoneBroth[8],
                                    ),
                                    DetailRow(
                                      name: porkBoneBroth[9],
                                      amount: double.parse(porkBoneBroth[10]) * _person,
                                      unit: porkBoneBroth[11],
                                    ),
                                    DetailRow(
                                      name: porkBoneBroth[12],
                                      amount: double.parse(porkBoneBroth[13]) * _person,
                                      unit: porkBoneBroth[14],
                                    ),
                                    SizedBox(height: 8.0),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 8.0),
                                      child: Text(
                                        "Ramen",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            .copyWith(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.pink,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationStyle:
                                                  TextDecorationStyle.double,
                                            ),
                                      ),
                                    ),
                                    DetailRow(
                                      name: japaneseRamen[0],
                                      amount: double.parse(japaneseRamen[1]) * _person,
                                      unit: japaneseRamen[2],
                                    ),
                                    DetailRow(
                                      name: japaneseRamen[3],
                                      amount: double.parse(japaneseRamen[4]) * _person,
                                      unit: japaneseRamen[5],
                                    ),
                                    DetailRow(
                                      name: japaneseRamen[6],
                                      amount: double.parse(japaneseRamen[7]) * _person,
                                      unit: japaneseRamen[8],
                                    ),
                                    DetailRow(
                                      name: japaneseRamen[9],
                                      amount: 0.0,
                                      unit: japaneseRamen[11],
                                    ),
                                    SizedBox(height: 24.0),
                                    Row(
                                      children: [
                                        Spacer(),
                                        //minus 1 button
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (_person - 1 >= 1)
                                                _person -= 1;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.remove_circle_outline_rounded,
                                            size: 30.0,
                                            color: Colors.pink,
                                          ),
                                        ),

                                        Spacer(),

                                        //amount
                                        Text(
                                          _person.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2
                                              .copyWith(
                                                fontSize: 30.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.pink,
                                              ),
                                        ),

                                        Spacer(),

                                        //add 1 button
                                        IconButton(
                                          onPressed: () {
                                            setState(() => _person += 1);
                                          },
                                          icon: Icon(
                                            Icons.add_circle_outline_rounded,
                                            size: 30.0,
                                            color: Colors.pink,
                                          ),
                                        ),

                                        Spacer(),
                                        Spacer(),
                                        Spacer(),

                                        //add to cart button
                                        SizedBox(
                                          width: size.width * 0.5,
                                          height: size.height * 0.08,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.pink,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons
                                                      .add_shopping_cart_rounded,
                                                  size: 28.0,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(width: 10.0),
                                                Text(
                                                  "Add to Cart",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2
                                                      .copyWith(
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
