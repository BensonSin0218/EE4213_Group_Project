import "package:flutter/material.dart";

class PaymentCard extends StatelessWidget {
  PaymentCard({Key key, this.position, this.image, this.title, this.selected, this.tapFunction}) : super(key: key);

  final int position;
  final String image, title;
  final List<bool> selected;
  final Function tapFunction;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Container(
      width: _size.width * 0.45,
      margin: EdgeInsets.only(
        top: 10.0,
        bottom: 20.0,
        left: 20.0
      ),
      child: GestureDetector(
        child: Column(
          children: <Widget> [
            Container(
              decoration: BoxDecoration(
                color: selected[position] ? Colors.white : Colors.blueGrey[200].withOpacity(0.5),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10.0,
                    offset: Offset(0, 5),
                    color: Colors.pink[300].withOpacity(0.25)
                  )
                ],
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget> [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0
                      ),
                      child: Image.asset(
                        image,
                        height: 100.0,
                      )
                    )
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: _size.width * 0.45,
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      height: 25.0,
                      child: Text(
                        "$title\n".toUpperCase(),
                        style: Theme.of(context).textTheme.button.copyWith(
                          fontWeight: FontWeight.bold
                        ),
                        overflow: TextOverflow.ellipsis
                      )
                    )
                  )
                ]
              )
            )
          ]
        ),
        onTap: () => tapFunction(position)
      )
    );
  }
}