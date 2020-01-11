import 'package:flutter/material.dart';
import 'package:recipe_app/Login.dart';

class Breakfast extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(child: RaisedButton(
      child: Text('Logout'),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
      }));
  }

}

Widget build(BuildContext context) {
  return Image(image: AssetImage('images/image.png'));
}