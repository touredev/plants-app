import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

import 'image_and_icons.dart';
import 'title_and_price.dart';

class Body extends StatelessWidget {
  const Body(
      {Key? key,
      required this.name,
      required this.price,
      required this.country})
      : super(key: key);

  final String name, country;
  final double price;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Colors.white,
      backgroundColor: kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
        ),
      ),
    );

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcons(size: size),
          TitleAndPrice(title: name, country: country, price: price),
          SizedBox(height: kDefaultPadding),
          Row(
            children: <Widget>[
              SizedBox(
                width: size.width / 2,
                height: 84,
                child: TextButton(
                  style: flatButtonStyle,
                  onPressed: () {},
                  child: Text(
                    "Buy Now",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: Text("Description",
                      style: TextStyle(color: Colors.black54, fontSize: 16)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
