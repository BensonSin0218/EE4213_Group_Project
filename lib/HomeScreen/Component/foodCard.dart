import "package:flutter/material.dart";

class FoodCard extends StatelessWidget {
  const FoodCard({Key key, this.image, this.title, this.country, this.tapFunction}) : super(key: key);

  final String image, title, country;
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
                color: Colors.white,
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
                    child: Image.asset(
                      image,
                      height: 100.0,
                      fit: BoxFit.fill
                    )
                  ),
                  SizedBox(
                    height: 10.0
                  ),
                  Container(
                    width: _size.width * 0.45,
                    padding: EdgeInsets.only(
                      bottom: 10.0,
                      left: 10.0,
                      right: 10.0
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [
                        Container(
                          height: 25.0,
                          child: Text(
                            "$title\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button.copyWith(
                              fontWeight: FontWeight.bold
                            ),
                            overflow: TextOverflow.ellipsis
                          )
                        ),
                        Container(
                          height: 25.0,
                          child: Text(
                            "$country".toUpperCase(),
                            style: TextStyle(
                              color: Colors.pink[300].withOpacity(0.5)
                            ),
                            overflow: TextOverflow.ellipsis
                          )
                        )
                      ],
                    )
                  )
                ],
              )
            ),
          ],
        ),
        onTap: tapFunction
      )
    );
  }
}