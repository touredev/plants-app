import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

import 'featured_plants.dart';
import 'header_with_search_box.dart';
import 'recommended_plants.dart';
import 'title_with_more_btn.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.plants}) : super(key: key);

  final List plants;

  @override
  Widget build(BuildContext context) {
    final recommendedPlants = List.from(plants.where((p) => p["recommended"] != null &&  p["recommended"] == true ));

    // It will provide us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // It enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Recommended", press: () {}),
          RecommendedPlants(plants: recommendedPlants),
          TitleWithMoreBtn(title: "Featured Plants", press: () {}),
          FeaturedPlants(),
          SizedBox(height: kDefaultPadding),
        ],
      )
    );
  }
}

