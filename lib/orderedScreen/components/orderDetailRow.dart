import 'package:flutter/material.dart';


class OrderDetailRow extends StatelessWidget {
  OrderDetailRow({Key key, this.title, this.content}) : super(key: key);

  final String title, content;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                color: Colors.pink,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Spacer(),
          Expanded(
            flex: 2,
            child: Text(
              content,
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                color: Colors.blueGrey,
                fontSize: 18.0,
              )
            )
          )
        ]
      )
    );
  }
}