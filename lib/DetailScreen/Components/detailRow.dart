import 'package:flutter/material.dart';

class DetailRow extends StatefulWidget {
  final String name;
  final double amount;
  final String unit;

  const DetailRow({Key key, this.name, this.amount, this.unit})
      : super(key: key);

  @override
  _DetailRowState createState() => _DetailRowState();
}

class _DetailRowState extends State<DetailRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Row(
        children: [
          Text(
            widget.name,
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  fontSize: 18.0,
                  color: Colors.pink[400],
                ),
          ),
          Spacer(),
          Text(
            widget.amount == 0.0
                ? "" + widget.unit
                : widget.amount.toString() + widget.unit,
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  fontSize: 18.0,
                  color: Colors.blueGrey[700],
                ),
          ),
        ],
      ),
    );
  }
}
