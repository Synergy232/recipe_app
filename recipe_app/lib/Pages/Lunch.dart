import 'package:flutter/material.dart';

class Lunch extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // return Center(child: Image.asset('images/lunch.jpeg'));
    return Container(
      margin: EdgeInsets.symmetric(vertical: 200),
          height: 50,
      child: ListView(
  scrollDirection: Axis.horizontal,
  children: <Widget>[
    Container(
      width: 160.0,
      color: Colors.red,
      child: Text('Some Lunch lmao'),
    ),
    Container(
      width: 160.0,
      color: Colors.blueGrey,
      child: Text('Some Lunch lmao'),
    ),
    Container(
      width: 160.0,
      color: Colors.red,
      child: Text('Some Lunch lmao'),
    ),
    Container(
      width: 160.0,
      color: Colors.blueGrey,
      child: Text('Some Lunch lmao'),
    ),
    Container(
      width: 160.0,
      color: Colors.red,
      child: Text('Some Lunch lmao'),
    ),
  ],
),
    );
  }

}