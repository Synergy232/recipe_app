import 'package:flutter/material.dart';
import 'package:recipe_app/Pages/Lunch.dart';

import 'Pages/Breakfast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            children: [
              Breakfast(),
              Lunch(),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
          bottomNavigationBar: Material(
            color: Colors.red,
            child: TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: Colors.white,
            indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'Breakfast'),
                Tab(text: 'Lunch'),
                Tab(text: 'Dinner'),
                Tab(text: 'Dessert')
              ],
              ),
          ),
        ),
      ),
    );
  }
}

//TODO: figure out how to handle the safe area