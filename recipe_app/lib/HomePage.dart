import 'package:flutter/material.dart';
import 'package:recipe_app/Pages/Lunch.dart';

import 'Pages/Breakfast.dart';
import 'Pages/Dinner.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.red,
          // ),
          body: TabBarView(
            children: [
              Breakfast(),
              Lunch(),
              Dinner(),
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
