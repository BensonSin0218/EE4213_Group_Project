import 'package:flutter/material.dart';

class PinkButton extends StatelessWidget {
  const PinkButton({
    Key key,
    @required this.size,
    this.pressed,
    this.icon,
    this.name,
  }) : super(key: key);

  final Size size;
  final Function pressed;
  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.07,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: pressed,
          style: ElevatedButton.styleFrom(
            primary: Colors.pink,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(36.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 28.0,
                color: Colors.white,
              ),
              SizedBox(width: 10.0),
              Text(
                name,
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                ),
              ),
            ],
          ),
      ),
    );
  }
}