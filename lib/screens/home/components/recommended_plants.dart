import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/details/details_screen.dart';

class RecommendedPlants extends StatelessWidget {
  const RecommendedPlants({
    Key? key,
    required this.plants,
  }) : super(key: key);

  final List plants;

  @override
  Widget build(BuildContext context) {
    final plantCards = <Widget>[];
    for (var p in plants) {
      plantCards.add(RecommendedPlantCard(
        image: p["image"],
        name: p["name"],
        country: p["country"],
        price: p["price"],
        description: p["description"],
        press: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(
                  name: p["name"], price: p["price"], country: p["country"]),
            ),
          );
        },
      ));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: plantCards,
      ),
    );
  }
}

class RecommendedPlantCard extends StatelessWidget {
  const RecommendedPlantCard({
    Key? key,
    required this.image,
    required this.name,
    required this.country,
    required this.price,
    required this.description,
    required this.press,
  }) : super(key: key);

  final String image, name, country, description;
  final double price;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset("assets/images/$image"),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2.5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: "$name\n",
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                          text: country.toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    style: TextStyle(fontSize: 20),
                    minFontSize: 14,
                    maxLines: 2,
                  )),
                  SizedBox(width: 10),
                  AutoSizeText(
                    '\$$price',
                    style: Theme.of(context).textTheme.button?.copyWith(
                        color: kPrimaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                    minFontSize: 11,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
