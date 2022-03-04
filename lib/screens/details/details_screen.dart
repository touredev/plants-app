import 'package:flutter/material.dart';
import 'package:plant_app/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen(
      {Key? key,
      required this.name,
      required this.price,
      required this.country})
      : super(key: key);

  final String name, country;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(name: name, country: country, price: price),
    );
  }
}
