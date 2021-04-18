import "package:flutter/material.dart";

class FoodItem extends StatelessWidget {
  FoodItem({Key key, this.itemNumber, this.amounts, this.position, this.foodList, this.price, this.addItem, this.subItem}) : super(key: key);

  final int itemNumber;
  final List<int> amounts;
  final List<int> position;
  final List<dynamic> foodList;
  final List<dynamic> price;
  final Function addItem, subItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget> [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Container(
              height: 25.0,
              child: Text(
                foodList[position[0]],
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
                overflow: TextOverflow.fade,
              )
            ),
            Container(
              height: 25.0,
              child: Text(
                (double.parse(foodList[position[1]]) * amounts[itemNumber]).toString().toUpperCase() + foodList[position[2]] + " / \$" + (price[itemNumber] * amounts[itemNumber]).toString(),
                style: TextStyle(
                  color: Colors.pink[400]
                )
              )
            ),
          ],
        ),
        Spacer(),
        Row(
          children: <Widget> [
            IconButton(
              splashRadius: 15.0,
              icon: Icon(
                Icons.remove_circle_outline_rounded,
                size: 30.0,
                color: amounts[itemNumber] == 0 ? Colors.blueGrey[200] : Colors.pink,
              ),
              onPressed: () => subItem(itemNumber)
            ),
            Text(
              amounts[itemNumber].toString(),
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              )
            ),
            IconButton(
              splashRadius: 15.0,
              icon: Icon(
                Icons.add_circle_outline_rounded,
                size: 30.0,
                color: Colors.pink,
              ),
              onPressed: () => addItem(itemNumber)
            ),
          ],
        )
      ],
    );
  }
}