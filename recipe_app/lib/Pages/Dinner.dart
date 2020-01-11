import 'package:flutter/material.dart';

class Dinner extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(child: Image(
      image: NetworkImage('https://images.unsplash.com/photo-1534070189982-818bb5622474?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80'),
    )
    );
  }

}
