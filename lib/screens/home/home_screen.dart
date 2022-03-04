import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/components/bottom_nav_bar.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/home/components/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _plants = [];

  // Fetch content from the json file
  Future<void> loadJsonData() async {
    final String response = await rootBundle.loadString('assets/plants.json');
    final data = await json.decode(response);
    setState(() {
      _plants = data["plants"];
    });
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"),
          onPressed: () { },
        ),
        elevation: 0,
      ),
      body: _plants.isNotEmpty ? Body(plants: _plants) : Container(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}