import 'package:flutter/material.dart';

class OrderDetailRow extends StatelessWidget {
  final String title;
  final String content;

  const OrderDetailRow({
    Key key, this.title, this.content,
  }) : super(key: key);

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
          Expanded(
            flex: 2,
            child: Text(
              content,
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                color: Colors.blueGrey,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}