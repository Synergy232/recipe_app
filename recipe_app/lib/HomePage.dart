import 'package:flutter/material.dart';

class VerticalAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: AppBar(
        primary: false,
        title: Text('My Bar'),
      ),
    );
  }
}