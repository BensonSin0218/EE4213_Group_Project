import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.pink[300],
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Container(
            height: size.height * 0.3,
            width: size.height * 0.3,
            color: Colors.pink[50],
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 35.0, bottom: 50.0),
                    child: SpinKitFadingCube(
                      color: Colors.pink,
                      size: size.height * 0.1,
                    ),
                  ),
                  Text(
                    "Processing",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                      fontFamily: "Lobster",
                      fontWeight: FontWeight.bold,
                      color: Colors.pink[400],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}